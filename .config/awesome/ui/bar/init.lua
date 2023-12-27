local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")

local helpers = require("helpers")
local color = require("ui.theme.colors")

local dpi = xresources.apply_dpi

local widgets = {
    get_taglist   = require("ui.bar.modules.tags"),
    get_tasklist  = require("ui.bar.modules.tasks"),
    get_layoutbox = require("ui.bar.modules.layouts"),
    arch          = require("ui.bar.modules.arch"),
    clock         = require("ui.bar.modules.clock"),
    volume        = require("ui.bar.modules.volume"),
    weather       = require("ui.bar.modules.weather"),
    pomodoro      = require("ui.bar.modules.pomodoro")
    -- laptop widgets
    -- battery       = require("ui.bar.modules.battery"),
    -- brightness    = require("ui.bar.modules.brightness"),
}

screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])

    s.layoutbox = widgets.get_layoutbox(s)
    s.taglist = widgets.get_taglist(s)
    s.tasklist = widgets.get_tasklist(s)

    s.wibox = awful.wibar({
        position = "top",
        type = "toolbar",
        screen = s,
        border_width = beautiful.border_width,
        border_color = color.surface2,
        height = dpi(32),
        width = s.geometry.width - beautiful.useless_gap * 6,
        bg = color.crust,
        shape = helpers.mkroundedrect(3 * beautiful.useless_gap),
        input_passthrough = true,
    })
    s.wibox.y = beautiful.useless_gap

    s.wibox:setup {
        {
            -- Left widgets
            widgets.arch,
            spacing = 5,
            layout = wibox.layout.fixed.horizontal,
            s.taglist,
        },
        {
            -- Middle widgets
            layout = wibox.layout.fixed.horizontal,
            s.tasklist,
        },
        {
            -- Right widgets
            widgets.pomodoro,
            widgets.weather,
            widgets.volume,
            -- laptop widgets
            -- widgets.brightness,
            -- widgets.battery,
            widgets.clock,
            s.layoutbox,
            spacing = 5,
            layout = wibox.layout.fixed.horizontal,
        },
        spacing = 5,
        layout = wibox.layout.align.horizontal
    }
end)
