local wibox = require("wibox")
local awful = require("awful")
-- local gears = require("gears")
local color = require("ui.theme.colors")
local helpers = require("helpers")
local beautiful = require("beautiful")

-- Weather widget

local weather_icons = {
    -- clear sky
    ["01d"] = {icon = " ", color = color.peach},
    ["01n"] = {icon = "󰖔 ", color = color.lavender},
    -- few clouds
    ["02d"] = {icon = "󰖕 ", color = color.yellow},
    ["02n"] = {icon = "󰼱 ", color = color.lavender},
    -- scattered clouds
    ["03d"] = {icon = " ", color = color.subtext0},
    ["03n"] = {icon = " ", color = color.subtext0},
    -- broken clouds
    ["04d"] = {icon = " ", color = color.subtext1},
    ["04n"] = {icon = " ", color = color.subtext1},
    -- shower rain
    ["09d"] = {icon = " ", color = color.sapphire},
    ["09n"] = {icon = " ", color = color.sapphire},
    -- rain
    ["10d"] = {icon = " ", color = color.sky},
    ["10n"] = {icon = " ", color = color.sky},
    -- thunderstorm
    ["11d"] = {icon = " ", color = color.blue},
    ["11n"] = {icon = " ", color = color.blue},
    -- snow (who am I kidding)
    ["13d"] = {icon = "󰖘 ", color = color.text},
    ["13n"] = {icon = "󰖘 ", color = color.text},
    -- mist
    ["50d"] = {icon = " ", color = color.rosewater},
    ["50n"] = {icon = " ", color = color.lavender},
}

local function get_weather_icon(icon_id)
    local try_icon = weather_icons[icon_id]
    if try_icon == nil then
        return {icon = "󰨹 ", color = color.red}
    end
    return try_icon
end


local weather_text = wibox.widget {
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox,
    font = "IosevkaTerm Nerd Font 12"
}

awesome.connect_signal("weather::update", function(icon, temperature)
    local weather_info = get_weather_icon(icon)
    weather_text.text = weather_info.icon .. " " .. temperature .. "°C"
    -- awesome.emit_signal("property::fg", weather_background, color.yellow)
end)


local container_weather_widget = {
    {
        {
            {
                widget = weather_text
            },
            left   = 6,
            right  = 6,
            top    = 0,
            bottom = 0,
            widget = wibox.container.margin
        },
        shape  = helpers.mkroundedrect(3 * beautiful.useless_gap),
        fg     = color.lavender,
        bg     = color.surface0,
        widget = wibox.container.background
    },
    left   = 0,
    right  = 0,
    top    = 6,
    bottom = 6,
    widget = wibox.container.margin
}



return container_weather_widget
