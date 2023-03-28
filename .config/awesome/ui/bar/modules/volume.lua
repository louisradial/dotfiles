local wibox = require("wibox")
local awful = require("awful")
-- local gears = require("gears")
local color = require("ui.theme.colors")
local helpers = require("helpers")
local beautiful = require("beautiful")

local utils = require("ui.bar.utils")
local draw_bar = utils.draw_bar
-- Volume widget

local volume_text = wibox.widget {
    align  = 'center',
    valign = 'center',
    -- font = 'IosevkaTerm Nerd Font Mono 12',
    widget = wibox.widget.textbox
}

local update_vol_widget = function(volume_level, volume_mute)
    local image = ""
    if volume_mute then
        -- image = beautiful.vol_mute
        image = " "
    else
        -- image = beautiful.vol
        image = " "
    end
    -- volume_icon.image = image
    volume_text.text = image .. volume_level
end

-- local _, volume_signal = awful.widget.watch(
--     'bash -c "pactl list sinks | awk \'NR==9 {print $2} NR==10 {print $5,$12}\'"', 7200,
--     function(_, stdout)
--         local words = {}
--         for word in string.gmatch(stdout, "[^(%p|%s)]+") do
--             table.insert(words, word)
--         end
--         local volume_mute = (words[1] == 'yes')
--         local volume_level = draw_bar(tonumber(words[2]) / 100.0)
--         update_vol_widget(volume_level, volume_mute)
--     end)

awesome.connect_signal("volume::update", function(ratio, muted)
    update_vol_widget(draw_bar(ratio), muted)
end)

local container_vol_widget = {
    {
        {
            {
                widget = volume_text
            },
            left   = 6,
            right  = 6,
            top    = 0,
            bottom = 0,
            widget = wibox.container.margin
        },
        shape  = helpers.mkroundedrect(3 * beautiful.useless_gap),
        fg     = color.pink,
        bg     = color.surface0,
        widget = wibox.container.background
    },
    left   = 0,
    right  = 0,
    top    = 6,
    bottom = 6,
    widget = wibox.container.margin
}

return container_vol_widget
