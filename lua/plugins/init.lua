require('lazy').setup({
	-- THEME
	{
		'folke/tokyonight.nvim',
		config = function()
			vim.cmd('colorscheme tokyonight-night')
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require("plugins.config.lualine")
		end,
		lazy = false
	},


	-- CORE
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.config.nvim-tree")
		end,
	},
	{
		'akinsho/bufferline.nvim',
		lazy = false,
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require("plugins.config.bufferline")
		end,
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make'
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		dependencies = 'nvim-lua/plenary.nvim',
		config = function()
			require("plugins.config.telescope")
		end,
	},
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		-- config = true, ??
		config = function()
			require("plugins.config.toggleterm")
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {},
		tag = "v2.10.0",
		cmd = { "Trouble", "TroubleToggle" },
		requires = "nvim-tree/nvim-web-devicons",
	},

	-- LSP
	{
		'williamboman/mason.nvim',
		opts = {},
		lazy = false
	},
	{
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		dependencies = {
			'petertriho/cmp-git',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-calc',
			'hrsh7th/cmp-nvim-lua',
		},
		config = function()
			require("plugins.config.cmp")
		end,
	},
	{
		'neovim/nvim-lspconfig',
		cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
		},
		config = function()
			require("plugins.config.lspconfig")
		end,
	},

	-- EXTRAS
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
	'rafamadriz/friendly-snippets',
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require("plugins.config.gitsigns")
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require("plugins.config.nvim-treesitter")
		end,
	},
	{
		'brenoprata10/nvim-highlight-colors',
		config = function()
			require("plugins.config.nvim-highlight-colors")
		end,
	},
	{
		'numToStr/Comment.nvim',
		config = function()
			require("plugins.config.comment")
		end,
	},
	'JoosepAlviste/nvim-ts-context-commentstring',
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		-- fix
		build = function() vim.fn["mkdp#util#install"]() end,
	}
})
