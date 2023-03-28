local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local helpers = require("helpers")
local color = require("ui.theme.colors")

local get_tasklist = function(s)
    return awful.widget.tasklist {
        screen          = s,
        filter          = awful.widget.tasklist.filter.currenttags,
        buttons         = gears.table.join(
            awful.button({}, 1, function(c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            awful.button({}, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
            awful.button({}, 4, function() awful.client.focus.byidx(-1) end),
            awful.button({}, 5, function() awful.client.focus.byidx(1) end)
        ),
        -- style           = {
        --     -- shape_border_width = 0,
        --     -- shape_border_color = color.lavender,
        --     -- shape = gears.shape.rounded_bar,
        --     -- font = "Iosevka Nerd Font 12"
        -- },
        layout          = {
            spacing = 0,
            layout = wibox.layout.fixed.horizontal,
        },
        widget_template = {
            {
                {
                    {
                        {
                            {
                                id = 'icon_role',
                                -- resize = true,
                                -- downscale = true,
                                widget = wibox.widget.imagebox,
                            },
                            margin = 2,
                            widget = wibox.container.margin,
                        },
                        {
                            text = " ",
                            widget = wibox.widget.textbox,
                        },
                        {
                            {
                                {
                                    id = 'text_role',
                                    align = "center",
                                    valign = "center",
                                    widget = wibox.widget.textbox,
                                },
                                strategy = "max",
                                width = 200,
                                widget = wibox.container.constraint,
                            },
                            left = 0,
                            right = 0,
                            widget = wibox.container.margin,
                        },
                        layout = wibox.layout.align.horizontal,
                    },
                    left = 6,
                    right = 6,
                    widget = wibox.container.margin,
                },
                id = 'background_role',
                -- colors and shape set by theme.
                widget = wibox.container.background,
            },
            top = 6,
            bottom = 6,
            left = 6,
            widget = wibox.container.margin,
        }

        -- Notice that there is *NO* wibox.wibox prefix, it is a template,
        -- not a widget instance.
        -- widget_template = {
        --     {
        --         {
        --             {
        --                 {
        --                     {
        --                         id = 'icon_role',
        --                         widget = wibox.widget.imagebox,
        --                     },
        --                     margins = 2,
        --                     widget = wibox.container.margin,
        --                 },
        --                 {
        --                     id     = "text_role",
        --                     widget = wibox.widget.textbox,
        --                 },
        --                 layout = wibox.layout.fixed.horizontal,
        --             },
        --             left   = 10,
        --             right  = 10,
        --             -- top    = 0,
        --             -- bottom = 0,
        --             widget = wibox.container.margin,
        --         },
        --         fg     = widget_fg,
        --         bg     = widget_bg,
        --         shape  = gears.shape.rounded_bar,
        --         widget = wibox.container.background,
        --     },
        --     left   = 0,
        --     right  = 0,
        --     top    = 7,
        --     bottom = 7,
        --     widget = wibox.container.margin
        -- },
    }
end

return get_tasklist
