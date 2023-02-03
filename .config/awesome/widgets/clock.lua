local wibox = require("wibox")
local gears = require("gears")
local theme = require("theme")

local container_clock_widget = {
    {
        {
            {
                {
                    widget = wibox.widget.textclock(),
                },
                left   = 6,
                right  = 6,
                top    = 0,
                bottom = 0,
                widget = wibox.container.margin
            },
            shape  = gears.shape.rounded_bar,
            fg     = theme.color_palette.pink,
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
    container = container_clock_widget
}
