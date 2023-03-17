require('radial.config.options')
require('radial.config.lazy')

vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        require('radial.config.autocmds')
        require('radial.config.keymaps')
    end,
})
