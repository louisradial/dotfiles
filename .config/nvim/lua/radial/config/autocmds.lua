local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup('HighlightYank', {clear = true})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 60,
        })
    end,
})

local postspace_group = augroup('DeletePostspace', {clear = true})
autocmd({'BufWritePre'}, {
    group = postspace_group,
    pattern = '*',
    command = [[%s/\s\+$//e]]
})
