local wibox = require("wibox")
local beautiful = require("beautiful")
local color = require("ui.theme.colors")
local helpers = require("helpers")

-- Battery widget
local battery_text = wibox.widget {
    align  = 'center',
    valign = 'center',
    -- font = 'IosevkaTerm Nerd Font Mono 12',
    widget = wibox.widget.textbox
}
local battery_icon = wibox.widget {
    align = 'center',
    valign = 'center',
    widget = wibox.widget.imagebox
}

local container_battery_widget = wibox.widget {
    {
        {
            {
                {
                    widget = battery_icon
                },
                {
                    widget = battery_text
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
        bg     = color.surface0,
        widget = wibox.container.background
    },
    left   = 0,
    right  = 0,
    top    = 6,
    bottom = 6,
    widget = wibox.container.margin
}

local update_widget = function(capacity, charging)
    local image_icon = beautiful.bat_plug
    local text_color = color.teal
    if charging then
        image_icon  = beautiful.bat_plug
        text_color = color.teal
    else
        if capacity >= 80 then
            image_icon  = beautiful.bat_5
            text_color = color.green
        elseif capacity >= 60 then
            image_icon  = beautiful.bat_4
            text_color = color.yellow
        elseif capacity >= 40 then
            image_icon  = beautiful.bat_3
            text_color = color.peach
        elseif capacity >= 20 then
            image_icon  = beautiful.bat_2
            text_color = color.maroon
        else
            image_icon  = beautiful.bat_1
            text_color = color.red
        end
    end
    battery_text.text = capacity
    battery_icon.image = image_icon
    container_battery_widget.widget.fg = text_color
end

awesome.connect_signal("battery::update", function(capacity, charging)
    update_widget(capacity, charging)
end)

return container_battery_widget
