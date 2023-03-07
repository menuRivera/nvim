-- lua reference manual -> https://www.lua.org/manual/5.4/
-- nvim lua api reference -> https://neovim.io/doc/user/lua.html
-- nvim options reference -> https://neovim.io/doc/user/options.html

-- Basic config
vim.cmd[[silent! colorscheme tokyonight-night]]


-- Options
vim.o.relativenumber = true
-- vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Plugins adviced settings 
vim.g.loaded_newtrw = 1
vim.g.loaded_newtrwPlugin = 1
vim.opt.termguicolors = true

require('plugins')
require('keybindings')
