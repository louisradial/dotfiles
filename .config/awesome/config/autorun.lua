local awful = require("awful")
-- autorun
local autorun = true
local autorun_apps = {
    "picom",
    -- "nitrogen --restore",
    -- "gwe --hide-window"
}
if autorun then
    for app = 1, #autorun_apps do
        awful.util.spawn(autorun_apps[app])
    end
end
