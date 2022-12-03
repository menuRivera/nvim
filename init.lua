-- lua reference manual -> https://www.lua.org/manual/5.4/
-- nvim lua api reference -> https://neovim.io/doc/user/lua.html
-- nvim options reference -> https://neovim.io/doc/user/options.html

-- Basic config
vim.g.mapleader = " "
vim.cmd[[silent! colorscheme tokyonight-night]]

-- Options
vim.o.relativenumber = true

require('plugins')
require('keybindings')
