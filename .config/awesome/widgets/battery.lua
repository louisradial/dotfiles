-- Batery widget
-- local awful = require("awful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local gears = require("gears")
-- local dpi = require("beautiful").xresources.apply_dpi
local theme = require("theme")

local container_battery_widget = wibox.container

local battery_widget = wibox.widget {
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local update_battery_widget = function(battery_level, charging_status)
    local battery_icon = ""
    local discharging  = { "󱃍 ", "󰁺 ", "󰁻 ", "󰁼 ", "󰁽 ", "󰁾 ", "󰁿 ", "󰂀 ", "󰂁 ", "󰂂 ", " " }
    local charging     = { "󰢟 ", "󰢜 ", "󰂆 ", "󰂇 ", "󰂈 ", "󰢝 ", "󰂉 ", "󰢞 ", "󰂊 ", "󰂋 ", "󰂅 " }

    local id = 1
    if battery_level >= 95 then
        id = 11
    else id = math.ceil(battery_level / 10.0)
    end
    if charging_status == "Charging" or charging_status == "Full" then
        battery_icon = charging[id]
    else battery_icon = discharging[id]
    end

    battery_widget.text = battery_icon .. battery_level .. "%"
end

watch('bash -c "cat /sys/class/power_supply/BAT0/capacity; cat /sys/class/power_supply/BAT0/status"', 60,
    function(_, stdout)
        local words = {}
        for word in stdout:gmatch("[^%s]+") do
            table.insert(words, word)
        end
        local battery_level = tonumber(words[1])
        local charging_status = words[2]
        update_battery_widget(battery_level, charging_status)
    end)

container_battery_widget = {
    {
        {
            {
                {
                    widget = battery_widget,
                    font = "Roboto Mono Nerd Font 9"
                },
                left   = 12,
                right  = 12,
                top    = 0,
                bottom = 0,
                widget = wibox.container.margin
            },
            shape  = gears.shape.rounded_bar,
            fg     = theme.color_palette.green,
            bg     = theme.color_palette.surface0,
            widget = wibox.container.background
        },

        left   = 5,
        right  = 5,
        top    = 7,
        bottom = 7,
        widget = wibox.container.margin
    },
    spacing = 5,
    layout  = wibox.layout.fixed.horizontal,
}

return {
    container = container_battery_widget,
}
