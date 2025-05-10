require('lazy').setup({
	-- THEME
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd('colorscheme tokyonight-night')
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		-- event = 'VeryLazy',
		-- dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require("plugins.config.lualine")
		end,
	},

	-- CORE
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		cmd = { 'NvimTreeToggle' },
		-- dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.config.nvim-tree")
		end,
	},
	{
		'akinsho/bufferline.nvim',
		event = 'VeryLazy',
		version = "*",
		-- dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require("plugins.config.bufferline")
		end,
	},
	{
		'nvim-telescope/telescope.nvim',
		-- lazy = true,
		cmd = { 'Telescope' },
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-fzf-native.nvim',
		},
		config = function()
			require("plugins.config.telescope")
		end,
	},

	{
		'nvim-telescope/telescope-fzf-native.nvim',
		lazy  = true,
		build = 'make'
	},
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		keys = { '<c-`>' },
		config = function()
			require("plugins.config.toggleterm")
		end,
	},
	{
		"folke/trouble.nvim",
		opts = { icons = false },
		-- todo: update trouble.nvim
		tag = "v2.10.0",
		cmd = { "Trouble", "TroubleToggle" },
		requires = "nvim-tree/nvim-web-devicons",
	},

	-- LSP
	{
		'williamboman/mason.nvim',
		opts = {},
		event = 'VeryLazy',
	},
	{
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		dependencies = {
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-nvim-lua',
			'petertriho/cmp-git',
			'onsails/lspkind.nvim',
			'L3MON4D3/LuaSnip',
			'rafamadriz/friendly-snippets',
			'saadparwaiz1/cmp_luasnip'
		},
		config = function()
			require("plugins.config.cmp")
		end,
	},
	{
		'neovim/nvim-lspconfig',
		-- cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
		-- event = 'VeryLazy',
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
	{
		"folke/snacks.nvim",
		config = function()
			require('plugins.config.snacks')
		end
	},
	{
		'Wansmer/treesj',
		cmd = { 'TSJToggle', 'TSJSplit', 'TSJJoin' },
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		config = function()
			require('treesj').setup({})
		end,
	},
	{
		'lewis6991/gitsigns.nvim',
		event = { 'BufReadPre', 'BufNewFile' },
		config = function()
			require("plugins.config.gitsigns")
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter',
		event = 'VeryLazy',
		config = function()
			require("plugins.config.nvim-treesitter")
		end,
	},
	{
		'brenoprata10/nvim-highlight-colors',
		ft = { "tsx", "jsx", "html", "scss", "sass", "css", "vue" },
		config = function()
			require("plugins.config.nvim-highlight-colors")
		end,
	},
	{
		'numToStr/Comment.nvim',
		lazy = true,
		config = function()
			require("plugins.config.comment")
		end,
	},
	{
		'JoosepAlviste/nvim-ts-context-commentstring',
		lazy = true,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		-- fix
		build = function() vim.fn["mkdp#util#install"]() end,
	}
})
