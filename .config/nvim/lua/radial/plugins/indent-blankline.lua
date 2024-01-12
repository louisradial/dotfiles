return {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    event = 'BufReadPost',
    opts = {
        indent = {
            char = '┊',
        },
        whitespace = {
            remove_blankline_trail = true,
            -- show_current_context = true,
            -- show_current_context_start = true,
            -- space_char_blankline = " ",
        },
        scope = {
            enabled = true,
            show_start = true,
        },
        -- highlight = {
            -- show_trailing_blankline_indent = false,
        -- },
        -- options = { try_as_border = true, },
        exclude = {
            filetypes = { 'help', 'alpha', 'NvimTree', }
        }
    }
}
