require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	-- use 'gruvbox-community/gruvbox'
	use 'folke/tokyonight.nvim'

	use {
  		'nvim-lualine/lualine.nvim',
  		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use {
		'nvim-tree/nvim-tree.lua',
  		requires = {
    			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
  		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	use 'nvim-tree/nvim-web-devicons'
	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
	use {
		  'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use("petertriho/nvim-scrollbar")
	use'nvim-treesitter/nvim-treesitter'
end)

-- require plugins settings form this dir
require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.bufferline')
require('plugins.nvim-scrollbar')
require('plugins.nvim-treesitter')

