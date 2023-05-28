local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")

local update_time = 60-- seconds, I hope

local battery_info = {
    capacity = -1,
    charging = -1
}

-- look into acpid
local function update_info()
    awful.spawn.easy_async_with_shell(
        "cat /sys/class/power_supply/BAT0/capacity && cat /sys/class/power_supply/BAT0/status", function(stdout)
            local words = {}
            for word in stdout:gmatch("[^%s]+") do
                table.insert(words, word)
            end
            local capacity = tonumber(words[1])
            local charging = words[2] == "Charging" or words[2] == "Full"
            if capacity ~= battery_info.capacity or charging ~= battery_info.charging then
                battery_info.capacity = capacity
                battery_info.charging = charging
                awesome.emit_signal("battery::update", battery_info.capacity, battery_info.charging)
            end
        end)
end

gears.timer {
    timeout = update_time,
    call_now = true,
    autostart = true,
    callback = update_info,
}
