local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

-- beautiful.init(gears.filesystem.get_configuration_dir() .. "/theme/theme.lua")
local theme_path = awful.util.getdir("config") .. "/theme/theme.lua"
beautiful.init(theme_path)
