local awful = require("awful")
local beautiful = require("beautiful")
local ruled = require("ruled")

ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    ruled.client.append_rule {
        id         = "global",
        rule       = {},
        properties = {
            focus     = awful.client.focus.filter,
            raise     = true,
            screen    = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen
        }
    }
    -- Floating clients.
    ruled.client.append_rule {
        id         = "floating",
        rule_any   = {
            instance = { "copyq", "pinentry" },
            class    = {
                "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
                "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name     = {
                "Event Tester", -- xev.
            },
            role     = {
                "AlarmWindow",   -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "pop-up",        -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    }
    -- Add titlebars to normal clients and dialogs
    ruled.client.append_rule {
        id         = "titlebars",
        rule_any   = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = false }
    }

    -- chatterino and streams on the same tag
    ruled.client.append_rule {
        rule_any = {
            class = { "chatterino" },
            instance = { "mpvchatterino" }
        },
        properties = { screen = 2, tag = "1" }
    }

    -- Firefox on tag "1" on screen 1
    ruled.client.append_rule {
        rule       = { class = "firefox" },
        properties = { screen = 1, tag = "1", switch_to_tags = true }
    }

    -- Steam on tag "2" on screen 2
    ruled.client.append_rule {
        rule       = {
            class = { "Steam" },
        },
        properties = { screen = 2, tag = "2", switch_to_tags = true }
    }

    -- eu4
    ruled.client.append_rule {
        rule = {
            class = "Paradox Launcher"
        },
        properties = { screen = 1, tag = "5", switch_to_tags = true }
    }
    ruled.client.append_rule {
        rule = {
            name = "Europa Universalis IV"
        },
        properties = { screen = 1, tag = "5", switch_to_tags = true, fullscreen = true }
    }

    -- -- Games full screen on tag "5" on screen 1
    -- ruled.client.append_rule {
    --     rule = {},
    --     properties = { fullscreen = true, screen = 1, tag = "5", switch_to_tags = true }
    -- }
end)

-- -- {{{ Rules
-- -- Rules to apply to new clients (through the "manage" signal).
-- awful.rules.rules = {
--     -- All clients will match this rule.
--     {
--         rule = {},
--         properties = {
--             border_width = beautiful.border_width,
--             border_color = beautiful.border_normal,
--             focus = awful.client.focus.filter,
--             raise = true,
--             keys = clientkeys,
--             buttons = clientbuttons,
--             screen = awful.screen.preferred,
--             placement = awful.placement.no_overlap + awful.placement.no_offscreen
--         }
--     },
--
--     -- Floating clients.
--     {
--         rule_any = {
--             instance = {
--                 "DTA",   -- Firefox addon DownThemAll.
--                 "copyq", -- Includes session name in class.
--                 "pinentry",
--             },
--             class = {
--                 "Arandr",
--                 "Blueman-manager",
--                 "Gpick",
--                 "Kruler",
--                 "MessageWin",  -- kalarm.
--                 "Sxiv",
--                 "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
--                 "Wpa_gui",
--                 "veromix",
--                 "xtightvncviewer"
--             },
--             -- Note that the name property shown in xprop might be set slightly after creation of the client
--             -- and the name shown there might not match defined rules here.
--             name = {
--                 "Event Tester", -- xev.
--             },
--             role = {
--                 "AlarmWindow",   -- Thunderbird's calendar.
--                 "ConfigManager", -- Thunderbird's about:config.
--                 "pop-up",        -- e.g. Google Chrome's (detached) Developer Tools.
--             }
--         },
--         properties = { floating = true }
--     },
--
--     -- Add titlebars to normal clients and dialogs
--     {
--         rule_any = { type = { "normal", "dialog" }
--         },
--         properties = { titlebars_enabled = false }
--     },
--
--     -- Set Firefox to always map on the tag named "2" on screen 1.
--     -- { rule = { class = "Firefox" },
--     --   properties = { screen = 1, tag = "2" } },
-- }
-- -- }}}
