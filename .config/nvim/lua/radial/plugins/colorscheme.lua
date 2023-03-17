local set_colorscheme = function(colorscheme)
    vim.o.background = "dark"
    vim.o.termguicolors = true
    vim.cmd("colorscheme " .. colorscheme)
end

return {
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        opts =  {
            style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            light_style = "day", -- The theme is used when the background is set to light
            transparent = false, -- Enable this to disable setting the background color
            transparent_sidebar = false,
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "transparent", -- style for sidebars, see below
                floats = "transparent", -- style for floating windows
            },
            sidebars = { "qf", "help", "NvimTree" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
            day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
            hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
            dim_inactive = false, -- dims inactive windows
            lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

        },
        config = function(_, opts)
            require('tokyonight').setup(opts)
            set_colorscheme("tokyonight-moon")
        end,
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = true,
    },
    {
        'marko-cerovac/material.nvim',
        lazy = true,
        config = function()
            vim.g.material_style = 'darker'
            set_colorscheme("material")
        end
    },
    {
        'ellisonleao/gruvbox.nvim',
        lazy = true,
        -- priority = 1000,
        opts = {
            contrast = 'hard'
        },
        config = function()
            set_colorscheme("gruvbox")
        end
    },
    {
        'savq/melange-nvim',
        lazy = true,
        config = function()
            set_colorscheme('melange')
        end
    }
}
