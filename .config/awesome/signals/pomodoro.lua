local awful                       = require("awful")
local naughty                     = require("naughty")
local gears                       = require("gears")
local beautiful                   = require("beautiful")
local dpi                         = beautiful.xresources.apply_dpi

-- timer parameters
local minutes                     = 60 -- seconds
local timeout_pomodoro            = 22.5 * minutes
local timeout_short_break         = 5 * minutes
local timeout_long_break          = 15 * minutes
local timeout_notification        = 0 -- obligatory interaction
local pomodoros_before_long_break = 4

-- notification parameters
local notification_width          = dpi(160)
local notification_height         = dpi(60)
local notification_title          = "   Pomodoro   "
local message_pomodoro            = " Starting timer "
local message_short_break_odd     = "󰉚  Snack time 󰉚 "
local message_short_break_even    = "   Work out   "
local message_long_break          = "   Long break   "

-- timers
local timer_pomodoro              = gears.timer({ timeout = timeout_pomodoro })
local timer_short_break           = gears.timer({ timeout = timeout_short_break })
local timer_long_break            = gears.timer({ timeout = timeout_long_break })

-- state enum
local state_id                    = {
    inactive = {},
    pomodoro = {},
    short_break_even = {},
    short_break_odd = {},
    long_break = {}
}

local pomodoros                   = {
    since_long_break = 0,
    current_session = 0,
    total = 0,
    state = state_id.inactive,
    waiting_user_input = false
}

local function pomodoro_update()
    local description = "inactive"
    if pomodoros.state == state_id.pomodoro then
        description = "pomodoro"
    elseif pomodoros.state == state_id.short_break_even then
        description = "short break even"
    elseif pomodoros.state == state_id.short_break_odd then
        description = "short break odd"
    elseif pomodoros.state == state_id.long_break then
        description = "long break"
    elseif pomodoros.total > 0 then -- only change color if completed at least a pomodoro
        description = "done"
    else
        description = "inactive"
    end
    awesome.emit_signal("pomodoro::update", description, tostring(pomodoros.total))
end

-- change state data
local function increment_pomodoros()
    pomodoros.total = pomodoros.total + 1
    pomodoros.current_session = pomodoros.current_session + 1
    pomodoros.since_long_break = pomodoros.current_session % pomodoros_before_long_break
    pomodoro_update()
end

-- determine next break based on state data
local function next_break()
    if pomodoros.since_long_break == 0 then
        return state_id.long_break
    end
    if pomodoros.since_long_break % 2 == 1 then
        return state_id.short_break_odd
    else
        return state_id.short_break_even
    end
end

local function break_start(next_state)
    if pomodoros.state == state_id.inactive then
        return
    end
    if next_state == state_id.long_break then
        timer_long_break:start()
    else
        timer_short_break:start()
    end
    pomodoros.state = next_state
    pomodoro_update()
end

local function pomodoro_start()
    if pomodoros.state == state_id.pomodoro then
        return
    end
    pomodoros.state = state_id.pomodoro
    timer_pomodoro:start()
    pomodoro_update()
end

-- determine next message for the next state
local function next_message(next_state)
    if next_state == state_id.long_break then
        return message_long_break
    elseif next_state == state_id.short_break_odd then
        return message_short_break_odd
    elseif next_state == state_id.short_break_even then
        return message_short_break_even
    else
        return message_pomodoro
    end
end

-- dismiss notifications to transition state
-- only alow a single notification at any given moment
local function pomodoro_notify(next_state)
    if pomodoros.waiting_user_input then
        return
    end
    pomodoros.waiting_user_input = true
    local ignore = false
    local notification = naughty.notification
        {
            title = notification_title,
            message = next_message(next_state),
            width = notification_width,
            height = notification_height,
            timeout = timeout_notification,
        }
    awful.spawn.with_shell("aplay ~/.config/awesome/scripts/cooking-bell-ding.wav")
    awesome.connect_signal("pomodoro::stop", function()
        ignore = true
        local notification_closed_reason_dismissed_by_user = 2 -- check docs
        notification:destroy(notification_closed_reason_dismissed_by_user, false)
    end)
    awesome.connect_signal("pomodoro::start", function()
        local notification_closed_reason_dismissed_by_user = 2 -- check docs
        notification:destroy(notification_closed_reason_dismissed_by_user, false)
    end)
    notification:connect_signal("destroyed", function(_)
        pomodoros.waiting_user_input = false
        if ignore then
            return
        end
        if next_state == state_id.pomodoro then
            pomodoro_start()
        else
            break_start(next_state)
        end
    end)
end

local function pomodoro_end()
    timer_pomodoro:stop()
    increment_pomodoros()
    local next_state = next_break()
    pomodoro_notify(next_state)
end

local function break_end()
    timer_short_break:stop()
    timer_long_break:stop()
    pomodoro_notify(state_id.pomodoro)
end

local function pomodoro_give_up()
    pomodoros.waiting = false
    timer_pomodoro:stop()
    timer_short_break:stop()
    timer_long_break:stop()
    pomodoros.state = state_id.inactive
    pomodoros.current_session = 0
    pomodoros.since_long_break = 0
    pomodoro_update()
end

timer_pomodoro:connect_signal("timeout", pomodoro_end)
timer_short_break:connect_signal("timeout", break_end)
timer_long_break:connect_signal("timeout", break_end)

awesome.connect_signal("pomodoro::start", function()
    if pomodoros.state == state_id.inactive then
        pomodoro_notify(state_id.pomodoro)
    end
end)

awesome.connect_signal("pomodoro::stop", function()
    pomodoro_give_up()
end)

-- local function debug_message()
--     local message = "debug, \npomodoro_timer: "
--     if pomodoro_timer.started then
--         message = message .. "started"
--     else
--         message = message .. "stopped"
--     end
--     message = message .. "\npomodoros: " .. pomodoros.since .. pomodoros.total .. "\nshort_break_timer: "
--     if short_break_timer.started then
--         message = message .. "started"
--     else
--         message = message .. "stopped"
--     end
--     message = message .. "\nlong_break_timer: "
--     if long_break_timer.started then
--         message = message .. "started"
--     else
--         message = message .. "stopped"
--     end
--     return message
-- end

-- gears.timer {
--     timeout = 3,
--     call_now = true,
--     autostart = true,
--     callback = function(_) pomodoro_notify(debug_message()) end,
-- }
