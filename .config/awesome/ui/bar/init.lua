local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")

local helpers = require("helpers")
local color = require("ui.theme.colors")
local utils = require("ui.bar.utils")

local dpi = xresources.apply_dpi

local widgets = {
    get_taglist   = require("ui.bar.modules.tags"),
    get_tasklist  = require("ui.bar.modules.tasks"),
    get_layoutbox = require("ui.bar.modules.layouts"),
    arch          = require("ui.bar.modules.arch"),
    clock         = require("ui.bar.modules.clock"),
    volume        = require("ui.bar.modules.volume"),
    weather       = require("ui.bar.modules.weather"),
    -- battery        = require("ui.bar.modules.battery"),
    -- brightness     = require("ui.bar.modules.brightness"),
}

screen.connect_signal("request::desktop_decoration", function(s)
    -- each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    -- s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.layoutbox = widgets.get_layoutbox(s)

    -- Create a taglist widget
    s.taglist = widgets.get_taglist(s)

    -- Create a tasklist widget
    s.tasklist = widgets.get_tasklist(s)

    -- Create the wibox
    s.wibox = awful.wibar({
        position = "top",
        type = "toolbar",
        screen = s,
        border_width = beautiful.border_width,
        border_color = color.surface2,
        height = dpi(32),
        width = s.geometry.width - beautiful.useless_gap * 4,
        bg = color.crust,
        shape = helpers.mkroundedrect(3 * beautiful.useless_gap),
        input_passthrough = true,
    })
    s.wibox.y = beautiful.useless_gap

    -- Add widgets to the wibox
    s.wibox:setup {
        {
            -- Left widgets
            widgets.arch,
            spacing = 5,
            layout = wibox.layout.fixed.horizontal,
            --mylauncher,
            s.taglist,
            -- s.mypromptbox,
        },
        {
            -- Middle widgets
            layout = wibox.layout.fixed.horizontal,
            s.tasklist,
        },
        {
            -- Right widgets
            --container_temp_widget,
            -- container_storage_widget,
            --container_cpu_widget,
            --container_mem_widget,
            -- container_brightness_widget,
            widgets.weather,
            widgets.volume,
            -- container_battery_widget,
            widgets.clock,
            s.layoutbox,
            spacing = 5,
            layout = wibox.layout.fixed.horizontal,
        },
        spacing = 5,
        layout = wibox.layout.align.horizontal
    }
end)
