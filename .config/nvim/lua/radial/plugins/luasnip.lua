return {
    'L3MON4D3/LuaSnip',
    dependencies = {
        'rafamadriz/friendly-snippets',
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
        end,
    },
    opts = {
        history = false,
        updateevents = "TextChanged,TextChangedI,TextChangedP",
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
        region_check_events = 'InsertEnter',
        delete_check_events = 'InsertLeave',
        -- ext_opts = {
        --     [types.choiceNode] = {
        --         active = {
        --             virt_text = { { "choiceNode", "Comment" } },
        --         },
        --     },
        -- },

    },
    config = function(_, opts)
        local ls = require("luasnip")
        local s = ls.snippet
        local sn = ls.snippet_node
        local isn = ls.indent_snippet_node
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node
        local c = ls.choice_node
        local d = ls.dynamic_node
        local r = ls.restore_node
        local events = require("luasnip.util.events")
        local ai = require("luasnip.nodes.absolute_indexer")
        local fmt = require("luasnip.extras.fmt").fmt
        local m = require("luasnip.extras").m
        local lambda = require("luasnip.extras").l
        local postfix = require("luasnip.extras.postfix").postfix
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
        local snippets_path = vim.fn.stdpath('config') .. '/snippets'
        local lslua = require('luasnip.loaders.from_lua')
        lslua.load({ paths = snippets_path })

        vim.api.nvim_create_user_command('LuaSnipReload', function()
            lslua.lazy_load({ paths = snippets_path })
        end, {})
    end,
}
