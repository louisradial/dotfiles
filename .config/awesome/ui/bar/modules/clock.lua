local wibox = require("wibox")
-- local gears = require("gears")
local color = require("ui.theme.colors")
local helpers = require("helpers")
local beautiful = require("beautiful")

-- Clock widget
local container_clock_widget = {
    {
        {
            widget = wibox.widget.textclock,
            valign = "center",
        },
        shape  = helpers.mkroundedrect(3 * beautiful.useless_gap),
        fg     = color.mauve,
        bg     = color.surface0,
        widget = wibox.container.background
    },
    left   = 0,
    right  = 0,
    top    = 6,
    bottom = 6,
    widget = wibox.container.margin
}

return container_clock_widget
