if false then return {}
else return {
    'lervag/vimtex',
    lazy = false,
    config = function(_)
        vim.g.vimtex_view_method = 'sioyek'
        vim.g.vimtex_matchparen_enabled = 0
        vim.g.vimtex_syntax_conceal_disable = 1

        -- note: VimTex uses latexmk as default.
        -- set lualatex as default latex engine
        vim.g.vimtex_compiler_latexmk = {
            aux_dir = '.aux',
            options = {
                '-shell-escape',
                '-verbose',
                '-file-line-error',
                '-synctex=1',
                '-interaction=nonstopmode'
            }
        }
        vim.g.vimtex_compiler_latexmk_engines = { _ = '-lualatex' }
    end
}
end
