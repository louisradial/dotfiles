local wibox = require("wibox")
local color = require("ui.theme.colors")
local helpers = require("helpers")
local beautiful = require("beautiful")

local utils = require("ui.bar.utils")
local draw_bar = utils.draw_bar

local brightness_icon = wibox.widget {
    align = 'center',
    valign = 'center',
    font = 'IosevkaTerm Nerd Font 12',
    widget = wibox.widget.textbox
}

local brightness_text = wibox.widget {
    align  = 'center',
    valign = 'center',
    -- font = 'IosevkaTerm Nerd Font 10',
    widget = wibox.widget.textbox
}

local update_brightness_widget = function(ratio)
    local image = "󰃡 "
    if ratio >= 2.0/3.0 then
        image = "󰃠 "
    elseif ratio >= 1.0/3.0 then
        image = "󰃟 "
    else
        image = "󰃞 "
    end
    brightness_icon.text = image
    brightness_text.text = draw_bar(ratio)
end

awesome.connect_signal("brightness::update", function(ratio)
    update_brightness_widget(ratio)
end)

local container_brightness_widget = {
    {
        {
            {
                {
                    widget = brightness_icon
                },
                {
                    widget = brightness_text
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
        fg     = color.rosewater,
        bg     = color.surface0,
        widget = wibox.container.background
    },
    left   = 0,
    right  = 0,
    top    = 6,
    bottom = 6,
    widget = wibox.container.margin
}

return container_brightness_widget
