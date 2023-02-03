local watch = require("awful.widget.watch")
local wibox = require("wibox")
local gears = require("gears")
local theme = require("theme")
local utils = require("widgets.utils")
-- Volume widget
local container_volume_widget = wibox.container

local volume_widget = wibox.widget {
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local update_volume_widget = function(volume_level, volume_mute)
    local volume_icon = ""
    if volume_mute then volume_icon = "  "
    else volume_icon = "  " end
    volume_widget.text = volume_icon .. volume_level
end

local _, volume_signal = watch('bash -c "amixer -M get Master | awk \'NR==5 {print $4 $6}\'"', 7200,
    function(_, stdout)
        local words = {}
        for word in string.gmatch(stdout, "[^%p]+") do
            table.insert(words, word)
        end
        local volume_level = utils.draw_bar(tonumber(words[1]) / 100.0)
        local volume_mute = (words[2] == 'off')
        update_volume_widget(volume_level, volume_mute)
    end)

container_volume_widget = {
    {
        {
            {
                {
                    widget = volume_widget,
                    font = "Roboto Mono Nerd Font 10"
                },
                left   = 12,
                right  = 12,
                top    = 0,
                bottom = 0,
                widget = wibox.container.margin
            },
            shape  = gears.shape.rounded_bar,
            fg     = theme.color_palette.red,
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
    container = container_volume_widget,
    signal = volume_signal,
}
