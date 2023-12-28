local wibox = require("wibox")
local color = require("ui.theme.colors")
local helpers = require("helpers")
local beautiful = require("beautiful")
-- local awful = require("awful")
-- local naughty = require("naughty")

-- Pomodoro widget
local pomodoro_icons = {
    ["inactive"] = { icon = "󱉟 ", color = color.overlay0 },
    ["pomodoro"] = { icon = "󰗚 ", color = color.mauve },
    ["short break odd"] = { icon = " ", color = color.mauve },
    ["short break even"] = { icon = "󰉚 ", color = color.mauve },
    ["long break"] = { icon = " ", color = color.mauve },
    ["done"] = { icon = "󱉟 ", color = color.mauve },
}

local function get_pomodoro_icon(icon_id)
    local try_icon = pomodoro_icons[icon_id]
    if try_icon == nil then
        return { icon = "󱉟 ", color = color.red }
    end
    return try_icon
end

local pomodoro_icon = wibox.widget {
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox,
    font   = "IosevkaTerm Nerd Font 12",
    text   = pomodoro_icons["inactive"].icon
}

local pomodoro_text = wibox.widget {
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox,
    text   = "0"
    -- font = "IosevkaTerm Nerd Font Mono 12"
}

local container_pomodoro_widget = wibox.widget {
    {
        {
            {
                {
                    widget = pomodoro_icon
                },
                {
                    widget = pomodoro_text
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

awesome.connect_signal("pomodoro::update", function(status, total)
    local icon = get_pomodoro_icon(status)
    pomodoro_text.text = total
    pomodoro_icon.text = icon.icon
    container_pomodoro_widget.widget.fg = icon.color
end)

return container_pomodoro_widget
