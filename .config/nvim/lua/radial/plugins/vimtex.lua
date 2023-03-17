return {
    'lervag/vimtex',
    lazy = false,
    config = function(_)
        -- TODO: please dual boot already and leave windows behind
        -- PDF viewer
        if vim.fn.has('win32') or (vim.fn.has('unix') and vim.fn.exists('$WSLENV')) then
            if vim.fn.executable('sioyek.exe') then
                vim.g.vimtex_view_method = 'sioyek'
                vim.g.vimtex_view_sioyek_exe = 'sioyek.exe'
                -- TODO: no such option?
                -- vim.g.vimtex_view_sioyek_options = '-reuse-instance'
                vim.g.vimtex_callback_progpath = 'wsl nvim'
            elseif vim.fn.executable('mupdf.exe') then
                vim.g.vimtex_view_general_viewer = 'mupdf.exe'
            end
        end

        -- note: VimTex uses latexmk as default.
        -- set lualatex as default latex engine
        vim.g.vimtex_compiler_latexmk_engines = { _ = '-lualatex' }
    end
}
