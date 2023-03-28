local awful = require("awful")
local wibox = require("wibox")


local function get_layoutbox(s)
    s.mylayoutbox = awful.widget.layoutbox {
        screen = s,
        buttons = {
            awful.button({}, 1, function() awful.layout.inc(1) end),
            awful.button({}, 3, function() awful.layout.inc(-1) end),
            awful.button({}, 4, function() awful.layout.inc(1) end),
            awful.button({}, 5, function() awful.layout.inc(-1) end),
        },
        margin = 6,
    }
    local layoutbox = wibox.widget({
        s.mylayoutbox,
        top    = 6,
        bottom = 6,
        left   = 0,
        right  = 6,
        widget = wibox.container.margin,
    })
    return layoutbox
end

return get_layoutbox
