local awful = require("awful")
local gears = require("gears")

local update_time = 7200 -- seconds, I hope
local max_brightness = 100
local min_brightness = 10
local step = (max_brightness - min_brightness) / 6

local function set_brightness_cmd(level)
    return "light -S " .. level
end

local function level_to_ratio(level)
    return (level - min_brightness) / (max_brightness - min_brightness)
end

local function level_within_bounds(raw_level)
    local level = raw_level
    if level >= max_brightness then
        level = max_brightness
    elseif level <= min_brightness then
        level = min_brightness
    end
    return level
end

local brightness_info = { level = 10 }

local function update_info()
    awful.spawn.easy_async_with_shell("light -G", function(stdout)
        local level = level_within_bounds(tonumber(stdout))
        if brightness_info.level ~= level then
            brightness_info.level = level
            awesome.emit_signal("brightness::update", level_to_ratio(level))
        end
    end)
end

gears.timer {
    timeout = update_time,
    call_now = true,
    autostart = true,
    callback = update_info,
}

-- only emit signal and spawn the command when there are changes
local function set_brightness(level)
    if brightness_info.level ~= level then
        brightness_info.level = level
        awful.spawn.with_shell(set_brightness_cmd(level))
        awesome.emit_signal("brightness::update", level_to_ratio(level))
    end
end

local function change_brightness(increase)
    local diff = 0
    if increase then
        diff = step
    else
        diff = -step
    end
    local level = level_within_bounds(brightness_info.level + diff)
    set_brightness(level)
end

awesome.connect_signal("brightness::set", function(increase)
    change_brightness(increase)
end)
