return {
    "hrsh7th/nvim-cmp",
    -- version = false, -- last release is way too old
    -- event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
        local cmp = require("cmp")
        return {
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<Left>"] = cmp.mapping.scroll_docs(-4),
                ["<Right>"] = cmp.mapping.scroll_docs(4),
                -- ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                -- ["<Tab>"] = nil,
                -- ["<S-Tab>"] = nil,
            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp", keyword_length = 5 },
                { name = "nvim_lua", keyword_length = 5 },
                { name = "luasnip",  keyword_length = 2 },
                { name = "buffer",   keyword_length = 5 },
                { name = "path",     keyword_length = 5 },
            }),
            -- view = { entries = 'native', },
            formatting = {
                format = function(_, item)
                    local icons = {
                        Array = " ",
                        Boolean = " ",
                        Class = " ",
                        Color = " ",
                        Constant = " ",
                        Constructor = " ",
                        Enum = " ",
                        EnumMember = " ",
                        Event = " ",
                        Field = " ",
                        File = " ",
                        Folder = " ",
                        Function = " ",
                        Interface = " ",
                        Key = " ",
                        Keyword = " ",
                        Method = " ",
                        Module = " ",
                        Namespace = " ",
                        Null = "ﳠ ",
                        Number = " ",
                        Object = " ",
                        Operator = " ",
                        Package = " ",
                        Property = " ",
                        Reference = " ",
                        Snippet = " ",
                        String = " ",
                        Struct = " ",
                        Text = " ",
                        TypeParameter = " ",
                        Unit = " ",
                        Value = " ",
                        Variable = " ",
                    }
                    if icons[item.kind] then
                        item.kind = icons[item.kind] .. item.kind
                    end
                    return item
                end,
            },
            -- experimental = {
            --     ghost_text = {
            --         hl_group = "LspCodeLens",
            --     },
            -- },
        }
    end,
    -- config = function(_, opts)
    --     require('cmp').setup(opts)
    --     -- vim.cmd[[highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080]]
    --     -- vim.cmd[[highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6]]
    --     -- vim.cmd[[highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch]]
    --     -- vim.cmd[[highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE]]
    --     -- vim.cmd[[highlight! link CmpItemKindInterface CmpItemKindVariable]]
    --     -- vim.cmd[[highlight! link CmpItemKindText CmpItemKindVariable]]
    --     -- vim.cmd[[highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0]]
    --     -- vim.cmd[[highlight! link CmpItemKindMethod CmpItemKindFunction]]
    --     -- vim.cmd[[highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4]]
    --     -- vim.cmd[[highlight! link CmpItemKindProperty CmpItemKindKeyword]]
    --     -- vim.cmd[[highlight! link CmpItemKindUnit CmpItemKindKeyword]]
    -- end,
}
