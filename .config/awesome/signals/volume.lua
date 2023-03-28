-- using media keys emits volume::mute or volume::change,
-- possibly interacting with the widget in the future too...
local awful = require("awful")
local gears = require("gears")

local update_time = 600 -- seconds, I hope
local max_level = 100    -- pactl lets you increase past 100%
local min_level = 40     -- pretty quiet already, should mute audio if needed to go lower
local step = (max_level - min_level) / 6

local ratio_to_level = function(ratio)
    if ratio >= 1.00 then return max_level end
    if ratio <= 0.00 then return min_level end
    local level = ratio * (max_level - min_level) + min_level
    return level -- gonna probably have to round off here
end

local level_to_ratio = function(level)
    if level >= max_level then return 1.00 end
    if level <= min_level then return 0.00 end
    local ratio = (level - min_level) / (max_level - min_level)
    return ratio -- gonna probably have to round off here
end

local get_audio_info_cmd = "pactl list sinks | awk \'NR==9 {print $2} NR==10 {print $5,$12}\'"
local get_level_cmd = "pactl get-sink-volume @DEFAULT_SINK@"
local get_mute_cmd = "pactl get-sink-mute @DEFAULT_SINK@"
local toggle_mute_cmd = "pactl set-sink-mute @DEFAULT_SINK@ toggle"
local set_level_cmd = function(level)
    return "pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ " .. level .. "%"
end

-- get audio info
local audio_info = {
    level = -1,
    muted = -1,
}

local function update_info()
    awful.spawn.easy_async_with_shell(get_audio_info_cmd,
        function(stdout)
            local words = {}
            for word in string.gmatch(stdout, "[^(%p|%s)]+") do
                table.insert(words, word)
            end
            local muted = (words[1] == 'yes')
            local level = tonumber(words[2])
            if level ~= audio_info.level or muted ~= audio_info.muted then
                audio_info.level = level
                audio_info.muted = muted
                awesome.emit_signal("volume::update", level_to_ratio(audio_info.level), audio_info.muted)
            end
        end)
end

gears.timer {
    timeout = update_time,
    call_now = true,
    autostart = true,
    callback = update_info,
}

awesome.connect_signal("volume::set_level", function(increase)
    local change = 0
    if increase then
        change = step
    else
        change = -step
    end
    local level = audio_info.level + change
    if level >= max_level then
        level = max_level
    elseif level <= min_level then
        level = min_level
    end
    if level ~= audio_info.level then
        awful.spawn.with_shell(set_level_cmd(level))
        audio_info.level = level
        awesome.emit_signal("volume::update", level_to_ratio(audio_info.level), audio_info.muted)
    end
end)

awesome.connect_signal("volume::toggle_mute", function()
    awful.spawn.with_shell(toggle_mute_cmd)
    audio_info.muted = not audio_info.muted
    awesome.emit_signal("volume::update", level_to_ratio(audio_info.level), audio_info.muted)
end)
