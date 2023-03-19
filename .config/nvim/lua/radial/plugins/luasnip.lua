return {
    'L3MON4D3/LuaSnip',
    dependencies = {
        'rafamadriz/friendly-snippets',
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
        end,
    },
    opts = {
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
        -- ext_opts={
        --     [types.choiceNodeA] = {
        --         active = {
        --             virt_text = {{"<-", "Error"}},
        --         },
        --     },
        -- },
    },
    config = function(_, opts)
        local ls = require("luasnip")
        ls.config.set_config(opts)

        vim.keymap.set({ "i", "s" }, "<C-k>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-j>", function()
            if ls.expand_or_jumpable(-1) then
                ls.expand_or_jump(-1)
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-l>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true })

        -- add snippets
        require('luasnip.loaders.from_lua').lazy_load({ paths = "~/.config/nvim/lua/radial/plugins/snips/" })
    end,
}
