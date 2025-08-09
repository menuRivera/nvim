vim.o.relativenumber = true
vim.o.number = true
-- vim.o.guibg = 'none'

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.shortmess:append("cWI")
vim.opt.shortmess = vim.opt.shortmess + 'cWI'
vim.opt.cmdheight = 0
-- vim.opt.smartindent = true
-- vim.opt.cindent = true
vim.opt.signcolumn = 'yes'
vim.opt.swapfile = false
-- vim.opt.expandtab = true

-- Plugins adviced settings
vim.g.loaded_newtrw = 1
vim.g.loaded_newtrwPlugin = 1
vim.opt.termguicolors = true

-- diagnostics
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
})

-- folds
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
