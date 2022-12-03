require('packer').startup(function()
	-- packer can manage itself
	use 'wbthomason/packer.nvim'

	-- colorscheme
	-- use 'gruvbox-community/gruvbox'
	use 'folke/tokyonight.nvim'
	use {
  		'nvim-lualine/lualine.nvim',
  		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
end)

require('plugins.lualine')
