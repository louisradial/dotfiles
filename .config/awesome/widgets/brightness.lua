-- local awful = require("awful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local gears = require("gears")
-- local dpi = require("beautiful").xresources.apply_dpi
local theme = require("theme")
local utils = require("widgets.utils")

-- Brightness widget
local container_brightness_widget = wibox.container

local brightness_widget = wibox.widget {
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local update_brightness_widget = function(brightness)
    brightness_widget.text = "  " .. brightness
end

local _, brightness_signal = watch('light -G', 7200, function(_, stdout)
    local brightness = utils.draw_bar(tonumber(stdout) / 100.0)
    update_brightness_widget(brightness)
end)

container_brightness_widget = {
    {
        {
            {
                {
                    widget = brightness_widget,
                    font = "Roboto Mono Nerd Font 10"
                },
                left   = 12,
                right  = 12,
                top    = 0,
                bottom = 0,
                widget = wibox.container.margin
            },
            shape  = gears.shape.rounded_bar,
            fg     = theme.color_palette.peach,
            bg     = theme.color_palette.surface0,
            widget = wibox.container.background
        },
        left   = 5,
        right  = 5,
        top    = 7,
        bottom = 7,
        widget = wibox.container.margin
    },
    spacing = 5,
    layout  = wibox.layout.fixed.horizontal,
}

return {
    container = container_brightness_widget,
    signal = brightness_signal,
}
