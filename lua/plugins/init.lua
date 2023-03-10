require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- theme
	use 'folke/tokyonight.nvim'

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
  		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	use 'nvim-tree/nvim-web-devicons'

	-- bufferline
	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
	-- telescope?
	use {
		  'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- use("petertriho/nvim-scrollbar")
	use'nvim-treesitter/nvim-treesitter'

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
				-- LSP Support
				{'neovim/nvim-lspconfig'},
				{'williamboman/mason.nvim'},
				{'williamboman/mason-lspconfig.nvim'},

				-- Autocompletion
				{'hrsh7th/nvim-cmp'},
				{'hrsh7th/cmp-buffer'},
				{'hrsh7th/cmp-path'},
				{'saadparwaiz1/cmp_luasnip'},
				{'hrsh7th/cmp-nvim-lsp'},
				{'hrsh7th/cmp-nvim-lua'},

				-- Snippets
				{'L3MON4D3/LuaSnip'},
				{'rafamadriz/friendly-snippets'},
			}
		}
end)
-- Install packages using :PackerSync

-- require plugins settings form this dir
require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.bufferline')
require('plugins.nvim-treesitter')
require('plugins.lsp-zero')
