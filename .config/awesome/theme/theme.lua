local awful                 = require("awful")
local gfs                   = require("gears.filesystem")
local theme_assets          = require("beautiful.theme_assets")
local xresources            = require("beautiful.xresources")

local color                 = require("theme.colors")

awful.util                  = require("awful.util")

local dpi                   = xresources.apply_dpi
local themes_path           = gfs.get_themes_dir()
local config_path           = awful.util.getdir("config") .. "theme/"
print(config_path)

local theme                 = {}
-- theme.color_palette         = color

theme.icon_theme            = nil

theme.wallpaper             = os.getenv("HOME") .. "/Pictures/76730978_p0.png"
-- theme.awesome_subicon = config_path .. "assets/bar/awesome.png"

theme.font                  = "Iosevka Nerd Font Mono 12"
-- theme.taglist_font                              = "Iosevka Nerd Font Mono 15"

theme.bg_normal             = color.crust
theme.bg_focus              = color.crust
theme.bg_urgent             = color.crust
theme.bg_minimize           = color.crust
theme.bg_systray            = color.crust

theme.fg_normal             = color.overlay0
theme.fg_focus              = color.mauve
theme.fg_urgent             = color.red
theme.fg_minimize           = color.text

theme.useless_gap           = dpi(2)
theme.systray_icon_spacing  = dpi(4)
theme.border_width          = dpi(1)
-- theme.rounded               = dpi(8)

theme.border_normal         = color.base
theme.border_focus          = color.mauve
theme.border_marked         = color.peach

theme.taglist_bg_focus      = color.crust
theme.taglist_fg_focus      = color.crust

theme.tasklist_bg_normal    = color.crust
theme.tasklist_fg_normal    = color.overlay1
theme.tasklist_bg_focus     = color.crust
theme.tasklist_fg_focus     = color.mauve

-- -- Generate taglist squares:
-- local taglist_square_size   = dpi(4)
-- theme.taglist_squares_sel   = theme_assets.taglist_squares_sel(
--     taglist_square_size, color.crust
-- )
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
--     taglist_square_size, color.crust
-- )

-- Variables set for theming notifications:
theme.notification_font = "IosevkaTerm Nerd Font Mono 10"
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

theme.menu_submenu_icon     = themes_path .. "default/submenu.png"
theme.menu_height           = dpi(15)
theme.menu_width            = dpi(90)
theme.menu_bg_normal        = color.crust
theme.menu_bg_focus         = color.overlay0
theme.menu_fg_focus         = color.mauve
theme.menu_border_color     = color.base
theme.menu_border_width     = dpi(1)

-- layout assets
theme.layout_spiral         = config_path .. "assets/layout/spiral.png"
theme.layout_floating       = config_path .. "assets/layout/float.png"
theme.layout_tile           = config_path .. "assets/layout/tile.png"

-- bar assets
-- theme.layout_archlogo = "/home/sv/pictures/Icons-AwesomeWM-Layouts-pastel/archlinux.png"

theme.tag_normal            = config_path .. "assets/bar/tag_normal.png"
theme.tag_clients           = config_path .. "assets/bar/tag_clients.png"
theme.tag_selected          = config_path .. "assets/bar/tag_selected.png"

theme.bat_5                 = themes_path .. "assets/bar/bat_5.png"
theme.bat_4                 = themes_path .. "assets/bar/bat_4.png"
theme.bat_3                 = themes_path .. "assets/bar/bat_3.png"
theme.bat_2                 = themes_path .. "assets/bar/bat_2.png"
theme.bat_1                 = themes_path .. "assets/bar/bat_1.png"
theme.bat_plug              = themes_path .. "assets/bar/bat_plug.png"

theme.vol                   = themes_path .. "assets/bar/vol.png"
theme.vol_mute              = themes_path .. "assets/bar/vol_mute.png"

-- beautiful.tasklist_plain_task_name = true

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
