-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- -- Standard awesome library
-- local gears = require("gears")
-- local awful = require("awful")
require("awful.autofocus")
-- -- Widget and layout library
-- local wibox = require("wibox")
-- -- Theme handling library
-- local beautiful = require("beautiful")
-- -- Notification library
-- local naughty = require("naughty")
-- local menubar = require("menubar")
-- local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
-- require("awful.hotkeys_popup.keys")

require("ui.theme")

require("ui.notifications")
require("signals")

-- some application icons were looking like shit before this, so...
awesome.set_preferred_icon_size(64) -- greater than 16 already looks fine.

require("config.layouts")

-- -- {{{ Menu
-- -- Create a launcher widget and a main menu
-- local myawesomemenu = {
--     { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
--     { "manual",  terminal .. " -e man awesome" },
--     { "config",  editor_cmd .. " " .. awesome.conffile },
--     { "restart", awesome.restart },
--     { "quit",    function() awesome.quit() end },
-- }
--
-- local mymainmenu = awful.menu({
--     items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
--         { "terminal", terminal }
--     }
-- })
--
-- -- local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
-- -- menu = mymainmenu })
--
-- -- Menubar configuration
-- menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- -- }}}

require("ui.wallpaper")

require("ui.bar")

require("config.mouse")

require("config.keymaps")

require("config.rules")

require("ui.titlebars")

require("config.signals")

require("config.autorun")
