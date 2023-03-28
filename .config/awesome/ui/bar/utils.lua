
local M = {}

-- utility function to draw bars
function M.draw_bar(ratio)
    local max_number = 6
    local on = ""
    local off = "·"
    local count_on = math.ceil(ratio * max_number)
    return string.rep(on, count_on) .. string.rep(off, max_number - count_on)
end

return M
