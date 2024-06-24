-- lua reference manual -> https://www.lua.org/manual/5.4/
-- nvim lua api reference -> https://neovim.io/doc/user/lua.html
-- nvim options reference -> https://neovim.io/doc/user/options.html

-- Basic config
-- vim.cmd [[silent! colorscheme tokyonight-night]]
-- vim.cmd[[hi! Normal ctermbg=none ctermfg=none guifg=none guibg=none]]
-- vim.cmd[[hi! LineNr ctermbg=none ctermfg=none guifg=none guibg=none]]

-- Options
vim.o.relativenumber = true
vim.o.number = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.signcolumn = 'yes'
vim.opt.swapfile = false


-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugins adviced settings
vim.g.loaded_newtrw = 1
vim.g.loaded_newtrwPlugin = 1
vim.opt.termguicolors = true

require('plugins')
require('keybindings')
