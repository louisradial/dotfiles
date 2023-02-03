-- local awful = require("awful")
-- local watch = require("awful.widget.watch")
local wibox = require("wibox")
-- local gears = require("gears")
-- local dpi = require("beautiful").xresources.apply_dpi
local theme = require("theme")

-- Arch widget
local container_arch_widget = {
    {
        {
            text = "  ",
            font = "JetBrainsMono Nerd Font 15",
            widget = wibox.widget.textbox,
        },
        left   = 0,
        right  = 5,
        top    = 2,
        bottom = 2,
        widget = wibox.container.margin
    },
    fg     = theme.color_palette.mauve,
    widget = wibox.container.background
}

return {
    container = container_arch_widget,
}
