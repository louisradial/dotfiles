return {
    'lervag/vimtex',
    lazy = false,
    config = function(_)
        vim.g.vimtex_view_method = 'sioyek'
        -- note: VimTex uses latexmk as default.
        -- set lualatex as default latex engine
        vim.g.vimtex_compiler_latexmk = {
            build_dir = '.out',
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
