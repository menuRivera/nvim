require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- theme
	use 'folke/tokyonight.nvim'
	-- use 'nvim-tree/nvim-web-devicons'
	use {
		"projekt0n/circles.nvim",
		requires = { "nvim-tree/nvim-web-devicons" }
	}

	-- lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	-- nvim-tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly'               -- optional, updated every week. (see issue #1193)
	}

	-- bufferline
	use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
	-- telescope?
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- Terminal
	use { "akinsho/toggleterm.nvim", tag = '*' }

	-- Trouble
	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	-- gitsigns
	use 'lewis6991/gitsigns.nvim'

	-- use("petertriho/nvim-scrollbar")
	use 'nvim-treesitter/nvim-treesitter'

	-- Comments
	use "terrortylor/nvim-comment"
	use 'JoosepAlviste/nvim-ts-context-commentstring'

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}
end)
-- Install packages using :PackerSync

-- require plugins settings form this dir
require('plugins.icons')
require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.bufferline')
require('plugins.nvim-treesitter')
require('plugins.nvim-comment')
require('plugins.lsp-zero')
require('plugins.gitsigns')
require('plugins.toggleterm')
