return {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPost',
    opts = {
        char = '┊',
        show_trailing_blankline_indent = false,
        show_current_context = true,
        show_current_context_start = true,
        space_char_blankline = " ",
        options = { try_as_border = true, },
        filetype_exclude = {
            'help',
            'alpha',
            'NvimTree',
        }
    }
}
