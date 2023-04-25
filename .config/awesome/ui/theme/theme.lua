local awful                     = require("awful")
local gears                     = require("gears")
-- local gfs                  = require("gears.filesystem")
-- local theme_assets         = require("beautiful.theme_assets")
local xresources                = require("beautiful.xresources")
local helpers                   = require("helpers")
local color                     = require("ui.theme.colors")

awful.util                      = require("awful.util")

local dpi                       = xresources.apply_dpi
-- local themes_path          = gfs.get_themes_dir()
local config_path               = awful.util.getdir("config") .. "ui/theme/"

local recolor                   = gears.color.recolor_image

local theme                     = {}
-- theme.color_palette         = color

theme.icon_theme                = nil

theme.wallpaper_image           = false
theme.wallpaper                 = os.getenv("HOME") .. "/Pictures/76730978_p0.png"
theme.wallpaper_color           = color.crust

theme.archlinux_icon            = config_path .. "assets/bar/archlinux-icon.svg"
theme.awesome_subicon           = config_path .. "assets/bar/archlinux-icon.svg"

theme.font                      = "Iosevka Nerd Font Mono 12"
theme.tasklist_font             = "Iosevka Nerd Font Mono 12"
-- theme.taglist_font         = "Iosevka Nerd Font Mono 12"

theme.bg_normal                 = color.crust
theme.bg_focus                  = color.crust
theme.bg_urgent                 = color.crust
theme.bg_minimize               = color.base
theme.bg_systray                = color.crust

theme.fg_normal                 = color.overlay0
theme.fg_focus                  = color.mauve
theme.fg_urgent                 = color.red
theme.fg_minimize               = color.subtext0

theme.useless_gap               = dpi(2)
theme.systray_icon_spacing      = dpi(4)
theme.border_width              = dpi(2)
theme.rounded                   = dpi(8)

theme.border_normal             = color.overlay0
theme.border_focus              = color.mauve
theme.border_marked             = color.peach

theme.taglist_bg_focus          = color.crust
theme.taglist_fg_focus          = color.crust

theme.tasklist_bg_normal        = color.surface0
theme.tasklist_fg_normal        = color.lavender
theme.tasklist_bg_focus         = color.surface0
theme.tasklist_fg_focus         = color.mauve
-- theme.tasklist_bg_minimize = color.base
-- theme.tasklist_fg_minimize = color.subtext0
theme.tasklist_shape            = helpers.mkroundedrect(3 * theme.useless_gap)

theme.hotkeys_bg                = color.surface0
theme.hotkeys_fg                = color.text
theme.hotkeys_border_color      = color.crust
theme.hotkeys_border_width      = dpi(1)
-- theme.hotkeys_shape       = helpers.mkroundedrect(3 * theme.useless_gap)
-- theme.hotkeys_label_bg     = color.flamingo -- not sure what it does.
theme.hotkeys_label_fg          = color.crust
theme.hotkeys_modifiers_fg      = color.mauve
theme.hotkeys_font              = "IosevkaTerm Nerd Font Mono 10"

-- -- Generate taglist squares:
-- local taglist_square_size   = dpi(4)
-- theme.taglist_squares_sel   = theme_assets.taglist_squares_sel(
--     taglist_square_size, color.crust
-- )
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
--     taglist_square_size, color.crust
-- )

-- Variables set for theming notifications:
theme.notification_font         = "IosevkaTerm Nerd Font Mono 10"
-- theme.notification_shape   = helpers.mkroundedrect(3*theme.useless_gap)
theme.notification_border_color = color.crust
theme.notification_border_width = dpi(3)
theme.notification_bg           = color.surface0
theme.notification_fg           = color.text
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

theme.menu_submenu_icon         = config_path .. "assets/bar/archlinux-icon.svg"
theme.menu_height               = dpi(15)
theme.menu_width                = dpi(90)
theme.menu_bg_normal            = color.base
theme.menu_bg_focus             = color.overlay0
theme.menu_fg_focus             = color.mauve
theme.menu_border_color         = color.base
theme.menu_border_width         = dpi(1)

-- layout assets
theme.layout_spiral             = recolor(config_path .. "assets/layout/spiral.png", color.red)
theme.layout_floating           = recolor(config_path .. "assets/layout/float.png", color.pink)
theme.layout_tile               = recolor(config_path .. "assets/layout/tile.png", color.mauve)

theme.tag_normal                = recolor(config_path .. "assets/bar/tag_normal.svg", color.overlay0)
theme.tag_clients               = recolor(config_path .. "assets/bar/tag_clients.svg", color.lavender)
theme.tag_selected              = recolor(config_path .. "assets/bar/tag_selected.svg", color.mauve)

theme.bat_5                     = recolor(config_path .. "assets/bar/bat_5.png", color.green)
theme.bat_4                     = recolor(config_path .. "assets/bar/bat_4.png", color.yellow)
theme.bat_3                     = recolor(config_path .. "assets/bar/bat_3.png", color.peach)
theme.bat_2                     = recolor(config_path .. "assets/bar/bat_2.png", color.maroon)
theme.bat_1                     = recolor(config_path .. "assets/bar/bat_1.png", color.red)
theme.bat_plug                  = recolor(config_path .. "assets/bar/bat_plug.png", color.teal)

theme.vol                       = recolor(config_path .. "assets/bar/vol.png", color.sky)
theme.vol_mute                  = recolor(config_path .. "assets/bar/vol_mute.png", color.sky)

-- theme.tasklist_plain_task_name = true

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=4:softtabstop=4:textwidth=80
