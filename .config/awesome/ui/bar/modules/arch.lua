local beautiful = require("beautiful")
local wibox = require("wibox")
-- -- Arch widget by the way
-- local container_arch_widget = {
--     {
--         {
--             text = " ",
--             font = "Iosevka Nerd Font 18",
--             widget = wibox.widget.textbox,
--         },
--         left   = 5,
--         right  = 5,
--         top    = 6,
--         bottom = 6,
--         widget = wibox.container.margin
--     },
--     fg     = color.mauve,
--     widget = wibox.container.background
-- }

-- Arch widget by the way
local container_arch_widget = {
    {
        image = beautiful.archlinux_icon,
        valign = "center",
        halign = "center",
        widget = wibox.widget.imagebox,
    },
    right   = 10,
    left  = 10,
    top    = 6,
    bottom = 6,
    widget = wibox.container.margin
}

return container_arch_widget
