require('lazy').setup({
	-- THEME
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd('colorscheme tokyonight-night')
		end
	},
	{
		"cdmill/neomodern.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("neomodern").setup({
				-- theme = 'roseprime',
				plain_float = true
			})
			require("neomodern").load()
			vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#171719' })
			vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#171719' })
			vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'NonText', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'TabLineFill', { bg = 'none' })
		end,
	},
	{
		'barrett-ruth/http-codes.nvim',
		config = true,
		dependencies = 'ibhagwan/fzf-lua',
		keys = { { '<leader>h', '<cmd>HTTPCodes<cr>' } }
	},
	{
		'nvim-lualine/lualine.nvim',
		-- event = 'VeryLazy',
		-- dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
		commit = "15884cee63a8c205334ab13ab1c891cd4d27101a",
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
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim",       -- Required for v0.4.0+
			"nvim-tree/nvim-web-devicons", -- If you want devicons
			"stevearc/resession.nvim"      -- Optional, for persistent history
		},
		config = function()
			require("plugins.config.cokeline")
		end
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
		'stevearc/conform.nvim',
		keys = {
			{
				'<leader>f',
				function()
					require('conform').format({})
				end,
				mode = { 'n', 'v' },
				desc = 'Format current buffer using conform'
			}
		},
		config = function()
			require("plugins.config.conform")
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
		'williamboman/mason-lspconfig.nvim',
		opts = {},
		lazy = true, -- it will be enabled in lspconfig setup
		dependencies = {
			{ 'williamboman/mason.nvim', opts = {}, },
		},
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
			-- { 'williamboman/mason.nvim' },
			-- { 'williamboman/mason-lspconfig.nvim' },
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
