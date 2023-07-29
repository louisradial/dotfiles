-- using media keys emits volume::mute or volume::change,
-- possibly interacting with the widget in the future too...
local awful = require("awful")
local gears = require("gears")

local update_time = 3600
local weather_cmd = "curl \'wttr.in/?format=1\'"

local weather_info = {
    icon = ' ',
    temperature = '20°C',
}

local function update_info()
    awful.spawn.easy_async_with_shell(weather_cmd,
        function(stdout)
            local words = {}
            for word in string.gmatch(stdout, "[^(+|%s)]+") do
                table.insert(words, word)
            end
            local icon = words[1]
            local temperature = words[2]
            if icon ~= weather_info.icon or temperature ~= weather_info.temperature then
                weather_info.icon = icon
                weather_info.temperature = temperature
                awesome.emit_signal("weather::update", weather_info.icon, weather_info.temperature)
            end
        end)
end

gears.timer {
    timeout = update_time,
    call_now = true,
    autostart = true,
    callback = update_info,
}
