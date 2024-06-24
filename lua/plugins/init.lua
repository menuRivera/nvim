-- 	use 'folke/tokyonight.nvim'
-- 	use({ "iamcco/markdown-preview.nvim", }) #later
-- 	use { 'nvim-lualine/lualine.nvim', }
-- 	use { 'nvim-tree/nvim-tree.lua', }
-- 	use { 'akinsho/bufferline.nvim' }
-- 	use { 'nvim-telescope/telescope.nvim', tag = '0.1.4', }
-- 	use { "akinsho/toggleterm.nvim", tag = '*' }
-- 	use { "folke/trouble.nvim", }
-- 	use 'lewis6991/gitsigns.nvim'
-- 	-- use("petertriho/nvim-scrollbar")
-- 	use 'nvim-treesitter/nvim-treesitter'
-- 	use "numToStr/Comment.nvim" #later
-- 	use 'JoosepAlviste/nvim-ts-context-commentstring' #later
-- 	use {
-- 		'VonHeikemen/lsp-zero.nvim',
-- 		branch = 'v1.x',
-- 		requires = {
-- 			-- LSP Support
-- 			{ 'neovim/nvim-lspconfig' },
-- 			{ 'williamboman/mason.nvim' },
-- 			{ 'williamboman/mason-lspconfig.nvim' },
--
-- 			-- Autocompletion
-- 			{ 'hrsh7th/nvim-cmp' },
-- 			{ 'hrsh7th/cmp-buffer' },
-- 			{ 'hrsh7th/cmp-path' },
-- 			{ 'saadparwaiz1/cmp_luasnip' },
-- 			{ 'hrsh7th/cmp-nvim-lsp' },
-- 			{ 'hrsh7th/cmp-nvim-lua' },
--
-- 			-- Snippets
-- 			{ 'L3MON4D3/LuaSnip' },
-- 			{ 'rafamadriz/friendly-snippets' },
-- 		}
-- 	}
-- end)

local plugins = {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		init = function() vim.cmd.colorscheme "tokyonight-night" end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = require('plugins.lualine')
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		-- config = require("plugins.nvim-tree")
		config = true
	},
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = require('plugins.bufferline')
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'BurntSushi/ripgrep',
		},
		config = require('plugins.telescope')
	},
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = require('plugins.toggleterm'),
	},
	{
		'folke/trouble.nvim',
		opts = {},
		version = '2.10.0'
	},
	{ 'lewis6991/gitsigns.nvim' },
	{ 'nvim-treesitter/nvim-treesitter' },

	-- lsp-zero
	{
		{
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v3.x',
			lazy = true,
			config = false,
			init = function()
				-- Disable automatic setup, we are doing it manually
				vim.g.lsp_zero_extend_cmp = 0
				vim.g.lsp_zero_extend_lspconfig = 0
			end,
		},
		{
			'williamboman/mason.nvim',
			lazy = false,
			config = true,
		},

		-- Autocompletion
		{
			'hrsh7th/nvim-cmp',
			event = 'InsertEnter',
			dependencies = {
				{ 'L3MON4D3/LuaSnip' },
			},
			config = function()
				-- Here is where you configure the autocompletion settings.
				local lsp_zero = require('lsp-zero')
				lsp_zero.extend_cmp()

				-- And you can configure cmp even more, if you want to.
				local cmp = require('cmp')
				local cmp_action = lsp_zero.cmp_action()

				cmp.setup({
					formatting = lsp_zero.cmp_format({ details = true }),
					mapping = cmp.mapping.preset.insert({
						['<C-Space>'] = cmp.mapping.complete(),
						['<C-u>'] = cmp.mapping.scroll_docs(-4),
						['<C-d>'] = cmp.mapping.scroll_docs(4),
						['<C-f>'] = cmp_action.luasnip_jump_forward(),
						['<C-b>'] = cmp_action.luasnip_jump_backward(),
					}),
					snippet = {
						expand = function(args)
							require('luasnip').lsp_expand(args.body)
						end,
					},
				})
			end
		},

		-- LSP
		{
			'neovim/nvim-lspconfig',
			cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
			event = { 'BufReadPre', 'BufNewFile' },
			dependencies = {
				{ 'hrsh7th/cmp-nvim-lsp' },
				{ 'williamboman/mason-lspconfig.nvim' },
			},
			config = function()
				-- This is where all the LSP shenanigans will live
				local lsp_zero = require('lsp-zero')
				lsp_zero.extend_lspconfig()

				--- if you want to know more about lsp-zero and mason.nvim
				--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
				lsp_zero.on_attach(function(client, bufnr)
					-- see :help lsp-zero-keybindings
					-- to learn the available actions
					lsp_zero.default_keymaps({ buffer = bufnr })
				end)

				require('mason-lspconfig').setup({
					ensure_installed = {},
					handlers = {
						-- this first function is the "default handler"
						-- it applies to every language server without a "custom handler"
						function(server_name)
							require('lspconfig')[server_name].setup({})
						end,
					}
				})
			end
		}
	}
}


require('lazy').setup(plugins, {
	performance = {
		cache = {
			enabled = true
		}
	}
})
