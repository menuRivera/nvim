-- lua reference manual -> https://www.lua.org/manual/5.4/
-- nvim lua api reference -> https://neovim.io/doc/user/lua.html
-- nvim options reference -> https://neovim.io/doc/user/options.html

-- Basic config
-- vim.cmd[[hi! Normal ctermbg=none ctermfg=none guifg=none guibg=none]]
-- vim.cmd[[hi! LineNr ctermbg=none ctermfg=none guifg=none guibg=none]]

-- Theme
vim.cmd('colorscheme tokyonight-night')

-- Options
vim.o.relativenumber = true
vim.o.number = true

vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.smartindent = true
-- vim.opt.cindent = true
vim.opt.signcolumn = 'yes'
vim.opt.swapfile = false
-- vim.opt.expandtab = true

-- Plugins adviced settings
vim.g.loaded_newtrw = 1
vim.g.loaded_newtrwPlugin = 1
vim.opt.termguicolors = true

require('plugins')
require('keybindings')
