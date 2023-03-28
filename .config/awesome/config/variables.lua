-- This is used later as the default terminal and editor to run.
local terminal = "kitty"

-- Editors
local editor = os.getenv("EDITOR") or "vim"
local editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
local modkey = "Mod4"

-- Default wallpaper
local wallpaper = os.getenv("HOME") .. "/Pictures/76730978_p0.png"

-- -- Default username
-- local username = os.getenv("USER"):gsub("^%l", string.upper),

-- Default font
local font = "Iosevka Nerd Font Mono"
local console_font = "IosevkaTerm Nerd Font Mono"

local user_variables = {
    terminal = terminal,
    editor = editor,
    editor_cmd = editor_cmd,
    modkey = modkey,
    wallpaper = wallpaper,
    -- username = username,
    font = font,
    console_font = console_font,
}

return user_variables
