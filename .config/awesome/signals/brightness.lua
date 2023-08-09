local awful = require("awful")
local gears = require("gears")

local update_time = 7200

local brightness_levels = {
    "4", "20", "36", "52", "68", "84", "100"
}

local function level_to_ratio(level)
    return (level - 1)/6
end

local function set_brightness_cmd(level)
    return "light -S " .. brightness_levels[level]
end

local function brightness_to_level(brightness)
    local c = 2^52 + 2^51
    return 1 + (0.06*brightness + c) - c
end

local function level_within_bounds(raw_level)
    local level = raw_level
    if level >= 7 then
        level = 7
    elseif level <= 1 then
        level = 1
    end
    return level
end

local brightness_info = { level = 0 }

local function update_info()
    awful.spawn.easy_async_with_shell("light -G", function(stdout)
        local raw_level = brightness_to_level(tonumber(stdout))
        local level = level_within_bounds(raw_level)
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
        diff = 1
    else
        diff = -1
    end
    local level = level_within_bounds(brightness_info.level + diff)
    set_brightness(level)
end

awesome.connect_signal("brightness::set", function(increase)
    change_brightness(increase)
end)
