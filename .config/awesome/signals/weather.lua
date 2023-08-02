local awful = require("awful")
local gears = require("gears")
-- local naughty = require("naughty") if debug is needed

-- do not commit this
local longitude =
local latitude =
local key =

local update_time = 1800
local weather_cmd = [[
    bash -c '
    KEY=]]..key..[[
    LAT=]]..latitude..[[
    LON=]]..longitude..[[

    weather=$(curl -sf "https://api.openweathermap.org/data/2.5/weather?lat=$LAT&lon=$LON&appid=$KEY&units=metric")

    if [ ! -z "$weather" ]; then
        weather_temp=$(echo "$weather" | jq ".main.temp")
        weather_icon=$(echo "$weather" | jq -r ".weather[].icon" | head -1)

        echo "$weather_icon"@"$weather_temp"
    else
        echo "??@??"
    fi
  ']]

local weather_info = {
    icon = "50d",
    temperature = '20°C',
}

local function update_info()
    awful.spawn.easy_async_with_shell(weather_cmd,
        function(stdout)
            local words = {}
            for word in string.gmatch(stdout, "[^(@|%s)]+") do
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
