-- handle lazyvim installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- plugins
require('lazy').setup({
	{ 'folke/tokyonight.nvim',     lazy = false },
	-- install without yarn or npm
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	{ 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{ 'akinsho/bufferline.nvim',       version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } }
})

-- require plugins settings form this dir
-- require('plugins.icons')
require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.bufferline')
-- require('plugins.comment')
-- require('plugins.nvim-treesitter')
-- require('plugins.lsp-zero')
-- require('plugins.gitsigns')
-- require('plugins.toggleterm')
