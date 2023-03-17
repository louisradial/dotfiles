return {
    'VonHeikemen/lsp-zero.nvim',
    event = 'VeryLazy',
    branch = 'v1.x',
    dependencies = {
        -- LSP support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim', lazy = true },
        { 'williamboman/mason-lspconfig.nvim', lazy = true },

        -- Snippets
        { 'L3MON4D3/LuaSnip', lazy = true },
        { 'rafamadriz/friendly-snippets', lazy = true },

        --
        { 'j-hui/fidget.nvim', lazy = true },
        { 'folke/neodev.nvim', lazy = true },
        { 'simrat39/rust-tools.nvim', lazy = true },
    },
    config = function()
        require('neodev').setup()
        local lsp = require 'lsp-zero'

        lsp.preset 'lsp-compe'
        lsp.ensure_installed({
            'lua_ls',
            'pyright',
            'rust_analyzer',
        })

        lsp.configure('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file('', true),
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    }
                }
            }
        })
        lsp.set_preferences({
            suggest_lsp_servers = false,
            sign_icons = {
                error = "",
                warn = "",
                hint = "",
                info = ""
            },
        })
        lsp.on_attach(function(_, bufnr)
            local map = function(mode, keys, action, desc)
                local opts = { buffer = bufnr, noremap = true, silent = true, desc = desc }
                return vim.keymap.set(mode, keys, action, opts)
            end
            map('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, "[F]ormat file")
            map('n', 'gd', vim.lsp.buf.definition, "[G]o to [d]efinition")
            map('n', 'K', vim.lsp.buf.hover, "Float definition")
            map('n', '<leader>vd', function() vim.diagnostic.open_float(nil, { focusable = false }) end,
                '[V]iew [D]iagnostics')
            map({ 'v', 'n' }, "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
            map("n", "<leader>vr", vim.lsp.buf.references, "[V]iew [R]eferences")
            map("n", "<leader>r", vim.lsp.buf.rename, "[R]ename")
            map("i", "<C-h>", vim.lsp.buf.signature_help, "Signature [H]elp")
        end)

        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
            update_in_insert = true,
            signs = true,
            virtual_text = true,
        }
        )

        local rust_lsp = lsp.build_options('rust_analyzer', {
            settings = {
                ["rust-analyzer"] = {
                    inlayHints = { locationLinks = false },
                },
            },
        })

        lsp.setup()

        require 'rust-tools'.setup({ server = rust_lsp })

        require('fidget').setup()
    end,
}
-- return {
--     "neovim/nvim-lspconfig",
--     event = "BufReadPre",
--     dependencies = {
--         { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
--         "mason.nvim",
--         "williamboman/mason-lspconfig.nvim",
--         "hrsh7th/cmp-nvim-lsp",
--     },
--     opts = {
--         diagnostics = {
--             underline = true,
--             update_in_insert = true,
--             virtual_text = { spacing = 4, prefix = "●" },
--             severity_sort = true,
--         },
--         autoformat = false,
--         -- format = {
--         --     formatting_options = nil,
--         --     timeout_ms = nil,
--         -- },
--         servers = {
--             jsonls = {},
--             sumneko_lua = {
--                 settings = {
--                     Lua = {
--                         diagnostics = {
--                             globals = { 'vim' },
--                         },
--                         workspace = {
--                             library = vim.api.nvim_get_runtime_file('', true),
--                             checkThirdParty = false,
--                         },
--                         completion = {
--                             callSnippet = "Replace",
--                         },
--                         telemetry = {
--                             enable = false,
--                         }
--                     },
--                 },
--             },
--         },
--         -- setup = {
--         --
--         -- },
--         config = function(plugin, opts)
--             local mason_lspconfig = require('mason-lspconfig')
--             local capabilities = vim.lsp.protocol.make_client_capabilities()
--             capabilities.textDocument.completion.completionItem.snippetSupport = true
--             local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--             local lsp_attach = function(client, bufnr)
--                 local map = function(mode, keys, action, desc)
--                     local opts = { buffer = bufnr, noremap = true, silent = true, desc = desc }
--                     return vim.keymap.set(mode, keys, action, opts)
--                 end
--                 map('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, "[F]ormat file")
--                 map('n', 'gd', vim.lsp.buf.definition, "[G]o to [d]efinition")
--                 map('n', 'K', vim.lsp.buf.hover, "Float definition")
--                 map('n', '<leader>vd', function() vim.diagnostic.open_float(nil, { focusable = false }) end,
--                     '[V]iew [D]iagnostics')
--                 map({ 'v', 'n' }, "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
--                 map("n", "<leader>vr", vim.lsp.buf.references, "[V]iew [R]eferences")
--                 map("n", "<leader>r", vim.lsp.buf.rename, "[R]ename")
--                 map("i", "<C-h>", vim.lsp.buf.signature_help, "Signature [H]elp")
--             end
--             mason_lspconfig.setup({
--                 ensure_installed = {
--                     -- 'clangd',
--                     'pyright',
--                     'sumneko_lua',
--                     'bashls',
--                     'jsonls',
--                     'rust_analyzer'
--                 }
--             })
--             local lspconfig = require('lspconfig')
--             mason_lspconfig.setup_handlers({
--                 function(server_name)
--                     lspconfig[server_name].setup({
--                         on_attach = lsp_attach,
--                         capabilities = lsp_capabilities,
--                     })
--                 end,
--             })
--         end,
--     }
-- }
