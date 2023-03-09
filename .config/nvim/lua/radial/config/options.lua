local o = vim.o
local g = vim.g

g.mapleader = ' '
g.maplocalleader = ' '

-- number lines and relative number lines
o.number = true
o.relativenumber = true
o.cursorline = true
-- o.showmatch = true

-- no need to show modes with lualine
o.showmode = false

-- indenting
o.breakindent = true
o.smartindent = true
o.autoindent = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
o.smarttab = true

-- search highlight
o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true

o.updatetime = 250
o.signcolumn = 'yes'
o.scrolloff = 8

-- completeopt
o.completeopt = 'menuone,noinsert,noselect'
vim.opt.shortmess:append "c"

-- format options
-- vim.opt.formatoptions:remove "o"
vim.cmd [[au BufEnter * set fo-=o fo-=r fo-=c]]
vim.opt.fillchars:append('eob: ')
