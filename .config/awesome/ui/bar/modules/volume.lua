local wibox = require("wibox")
local color = require("ui.theme.colors")
local helpers = require("helpers")
local beautiful = require("beautiful")

local utils = require("ui.bar.utils")
local draw_bar = utils.draw_bar
-- Volume widget

local volume_icon = wibox.widget {
    align = 'center',
    valign = 'center',
    font = 'IosevkaTerm Nerd Font 12',
    widget = wibox.widget.textbox
}

local volume_text = wibox.widget {
    align  = 'center',
    valign = 'center',
    -- font = 'IosevkaTerm Nerd Font 10',
    widget = wibox.widget.textbox
}

local update_vol_widget = function(volume_level, volume_mute)
    local image = ""
    if volume_mute then
        image = " "
    else
        image = " "
    end
    volume_icon.text = image
    volume_text.text = volume_level
end

awesome.connect_signal("volume::update", function(ratio, muted)
    update_vol_widget(draw_bar(ratio), muted)
end)

local container_vol_widget = {
    {
        {
            {
                {
                    widget = volume_icon
                },
                {
                    widget = volume_text
                },
                spacing = 4,
                layout = wibox.layout.fixed.horizontal,
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
