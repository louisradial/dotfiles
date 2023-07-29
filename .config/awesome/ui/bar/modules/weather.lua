local wibox = require("wibox")
local awful = require("awful")
-- local gears = require("gears")
local color = require("ui.theme.colors")
local helpers = require("helpers")
local beautiful = require("beautiful")

-- Weather widget

local weather_text = wibox.widget {
    align  = 'center',
    valign = 'center',
    -- font = 'IosevkaTerm Nerd Font Mono 12',
    widget = wibox.widget.textbox
}

awesome.connect_signal("weather::update", function(icon, temperature)
    weather_text.text = "" .. icon .. " " .. temperature
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
