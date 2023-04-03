return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        { 'nvim-tree/nvim-web-devicons' },
    },
    event = "VeryLazy",
    opts = function()
        local colors = require("tokyonight.colors").setup()

        local theme = {
            normal = {
                a = { bg = colors.blue, fg = colors.bg },
                b = { bg = colors.bg, fg = colors.blue },
                c = { bg = colors.bg, fg = colors.fg_sidebar },
            },
            insert = {
                a = { bg = colors.green, fg = colors.bg },
            },
            command = {
                a = { bg = colors.yellow, fg = colors.bg },
            },
            visual = {
                a = { bg = colors.magenta, fg = colors.bg },
            },
            replace = {
                a = { bg = colors.red, fg = colors.bg },
            },
            terminal = {
                a = { bg = colors.green1, fg = colors.bg },
            },
        }

        local space = {
            function() return " " end,
            color = { bg = colors.bg, fg = colors.blue },
            padding = { left = 1, right = 0 },
        }

        local filename = {
            'filename',
            color = { bg = colors.blue, fg = colors.bg_highlight },
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
        }

        local filetype = {
            "filetype",
            icon_only = true,
            colored = true,
            color = { bg = colors.bg_highlight },
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
        }

        local buffers = {
            'buffers',
            buffers_color = {
                active = { bg = colors.blue, fg = colors.terminal_black },
                inactive = { bg = colors.terminal_black, fg = colors.blue },
            },
            separator = { left = "", right = "" },
            on_click = nil,
            filetype_names = {
                TelescopePrompt = 'Telescope',
                dashboard = 'Dashboard',
                lazy = "Lazy",
                fzf = 'FZF',
                alpha = 'Alpha',
                toggleterm = 'terminal',
                NvimTree = 'File Tree',
            },                       -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
            symbols = {
                modified = ' ●',   -- Text to show when the buffer is modified
                alternate_file = '', -- Text to show to identify the alternate file
                directory = '',   -- Text to show when the buffer is a directory
            },
            padding = { left = 1, right = 1 },
        }

        local fileformat = {
            'fileformat',
            color = { bg = colors.purple, fg = colors.bg_highlight },
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
        }

        local encoding = {
            'encoding',
            color = { bg = colors.bg_highlight, fg = colors.purple },
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
        }

        local branch = {
            'branch',
            color = { bg = colors.teal, fg = colors.bg_highlight },
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
        }

        local diff = {
            "diff",
            colored = true,
            symbols = { added = '+', modified = '~', removed = '-' },
            color = { bg = colors.bg_highlight, fg = colors.teal },
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
        }

        local progress = {
            'progress',
            separator = { left = "", right = "" },
            color = { bg = colors.bg_highlight, fg = colors.cyan },
            padding = { left = 1, right = 1 },
        }

        local location = {
            'location',
            separator = { left = "", right = "" },
            color = { bg = colors.cyan, fg = colors.bg_highlight },
            padding = { left = 1, right = 1 },
        }

        local modes = {
            'mode',
            separator = { left = "", right = "" },
            color = { fg = colors.bg_highlight },
            padding = { left = 1, right = 1 },
        }

        local function getLspName()
            local msg = 'No LSP'
            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
                return msg
            end
            for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return "  " .. client.name
                end
            end
            return "  " .. msg
        end

        local diagnostics = {
            'diagnostics',
            color = { bg = colors.bg_highlight, fg = colors.red },
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
        }

        local lsp = {
            function()
                return getLspName()
            end,
            separator = { left = "", right = "" },
            color = { bg = colors.red, fg = colors.bg_highlight },
            padding = { left = 1, right = 1 },
        }

        local date = {
            function()
                return "  " .. os.date("%R")
            end,
            separator = { left = "", right = "" },
            color = { bg = colors.magenta, fg = colors.bg_highlight },
            padding = { left = 0, right = 0 },
        }

        return {
            options = {
                icons_enabled = true,
                theme = theme,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                -- component_separators = { left = '', right = '' },
                -- section_separators = { left = '', right = '' },
                -- component_separators = { left = '', right = '' },
                -- section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = { "dashboard", "alpha", "NvimTree", "lazy" },
                },
                ignore_focus = { "lazy", "NvimTree", "toggleterm", "TelescopePrompt", },
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = { modes, },
                lualine_b = { space, },
                lualine_c = { filename, filetype, space, branch, diff, },
                lualine_x = {},
                -- lualine_x = { encoding, fileformat, space, },
                lualine_y = { progress, location, space, },
                lualine_z = { diagnostics, lsp, }
            },
            inactive_sections = {},
            tabline = {
                lualine_a = {},
                lualine_b = { buffers, },
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { date, },
            },
            winbar = {},
            inactive_winbar = {},
            extensions = {
                'nvim-tree',
                'toggleterm',
            },
        }
    end,
}
