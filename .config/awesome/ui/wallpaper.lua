local beautiful = require("beautiful")
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local colors = require("ui.theme.colors")

-- local function set_wallpaper(s)
--     -- Wallpaper
--     if beautiful.wallpaper then
--         local wallpaper = beautiful.wallpaper
--         -- If wallpaper is a function, call it with the screen
--         if type(wallpaper) == "function" then
--             wallpaper = wallpaper(s)
--         end
--         gears.wallpaper.maximized(wallpaper, s, false)
--     end
-- end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
-- screen.connect_signal("property::geometry", set_wallpaper)
screen.connect_signal("request::wallpaper", function(s)
    if beautiful.wallpaper_image == true then
        gears.wallpaper.maximized(beautiful.wallpaper, s, false)
    else
        gears.wallpaper.set(beautiful.wallpaper_color)
    end
end)
