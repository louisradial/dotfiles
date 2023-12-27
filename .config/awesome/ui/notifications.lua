local naughty = require("naughty")
local beautiful = require("beautiful")
local helpers = require("helpers")
local color = require("ui.theme.colors")
local ruled = require("ruled")
local awful = require("awful")

local dpi = beautiful.xresources.apply_dpi

-- display errors
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)

-- display notification
naughty.connect_signal("request::display", function(n)
    naughty.layout.box {
        notification = n,
        -- position = 'bottom_right',
        -- bg = color.base,
        -- fg = color.text,
        -- shape = helpers.mkroundedrect(3*beautiful.useless_gap),
        minimum_width = dpi(150),
        -- offset = {y = dpi(100)},
        -- y = 90,
        -- x = 50
        placement = awful.placement.top_right + awful.placement.no_offscreen
    }
end)

ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule       = { },
        properties = {
            screen           = awful.screen.preferred,
            implicit_timeout = 5,
        }
    }
end)
