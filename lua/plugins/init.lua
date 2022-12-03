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
	use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
end)

-- require plugins settings form this dir
require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.barbar')
