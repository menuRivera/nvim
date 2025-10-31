require("lazy").setup({
	-- THEME
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd('colorscheme tokyonight-night')
		end,
	},
	{
		"cdmill/neomodern.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("neomodern").setup({
				-- theme = 'roseprime',
				plain_float = true,
			})
			require("neomodern").load()
		end,
	},
	{
		"barrett-ruth/http-codes.nvim",
		config = true,
		dependencies = "ibhagwan/fzf-lua",
		keys = { { "<leader>h", "<cmd>HTTPCodes<cr>" } },
	},
	{
		"nvim-lualine/lualine.nvim",
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
		-- cmd = { "NvimTreeToggle" },
		event = "VeryLazy",
		-- dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.config.nvim-tree")
		end,
	},
	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for v0.4.0+
			"nvim-tree/nvim-web-devicons", -- If you want devicons
			"stevearc/resession.nvim", -- Optional, for persistent history
		},
		config = function()
			require("plugins.config.cokeline")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		-- lazy = true,
		-- cmd = { "Telescope" },
		event = "VeryLazy",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		config = function()
			require("plugins.config.telescope")
		end,
	},
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({
						async = true,
						lsp_format = "fallback",
					})
				end,
				mode = { "n", "v" },
				desc = "Format current buffer using conform",
			},
		},
		config = function()
			require("plugins.config.conform")
		end,
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		lazy = true,
		build = "make",
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		keys = { "<c-`>" },
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
		"williamboman/mason-lspconfig.nvim",
		opts = {},
		lazy = true, -- it will be enabled in lspconfig setup
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"petertriho/cmp-git",
			"onsails/lspkind.nvim",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("plugins.config.cmp")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		-- cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
		-- event = 'VeryLazy',
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
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
			require("plugins.config.snacks")
		end,
	},
	{
		"Wansmer/treesj",
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.config.gitsigns")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		config = function()
			require("plugins.config.nvim-treesitter")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			enable = true,
			multiwindow = false, -- Enable multiwindow support.
			max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
			min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
			line_numbers = true,
			multiline_threshold = 20, -- Maximum number of lines to show for a single context
			trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
			mode = "topline", -- Line used to calculate context. Choices: 'cursor', 'topline'
			-- Separator between context and content. Should be a single character string, like '-'.
			-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
			separator = nil,
			zindex = 20, -- The Z-index of the context window
			on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
		},
	},
	{
		"brenoprata10/nvim-highlight-colors",
		ft = { "tsx", "jsx", "html", "scss", "sass", "css", "vue" },
		config = function()
			require("plugins.config.nvim-highlight-colors")
		end,
	},
	{
		"numToStr/Comment.nvim",
		lazy = true,
		config = function()
			require("plugins.config.comment")
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		-- fix
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
})
