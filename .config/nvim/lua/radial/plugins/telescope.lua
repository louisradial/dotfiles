return {
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        keys = {
            { '<leader>gf', '<cmd>Telescope git_files show_untracked=true<cr>', desc = '[G]it [F]iles' },
            { '<leader>sf', '<cmd>Telescope find_files<cr>', desc = '[S]earch [F]iles' },
            { '<leader>so', '<cmd>Telescope oldfiles<cr>', desc = '[S]earch [O]ld files' },
            { '<leader>sb', '<cmd>Telescope buffers hidden=true layout_config={prompt_position:"center"}<cr>',
                desc = '[S]earch [B]uffers' },
            { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = '[S]earch [H]elp' },
            { '<leader>sw', '<cmd>Telescope grep_string<cr>', desc = '[S]earch current [W]ord' },
            { '<leader>sg', '<cmd>Telescope live_grep<cr>', desc = '[S]earch by [G]rep' },
            { '<leader>sd', '<cmd>Telescope diagnostics<cr>', desc = '[S]earch [D]iagnostics' },
        },
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { "nvim-telescope/telescope-file-browser.nvim" },
        },
        config = function()
            local telescope = require('telescope')
            local builtin = require("telescope.builtin")
            local actions = require('telescope.actions')
            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    path_display = { "smart" },
                    file_ignore_patterns = { ".git", "node_modules" },
                    mappings = {
                        i = {
                            ['<C-j>'] = actions.move_selection_next,
                            ['<C-k>'] = actions.move_selection_previous,
                            ['<Esc>'] = actions.close,
                        },
                    },
                },
            })
            telescope.load_extension("file_browser")

            -- TODO make it available before lazy loads this plugin
            vim.keymap.set('n', '<leader>/', function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewr = false,
                })
            end)
        end,
    }
}
-- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
