local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
	view = {
		entries = "custom"
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text', -- show only symbol annotations
			menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				sql = "[SQL]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
			}),
			preset = "codicons",
			symbol_map = {
				sql = "",
				-- 	Text = "󰉿",
				-- 	Method = "󰆧",
				-- 	Function = "󰊕",
				-- 	Constructor = "",
				-- 	Field = "󰜢",
				-- 	Variable = "⏺",
				-- 	Class = "󰠱",
				-- 	Interface = "",
				-- 	Module = "",
				-- 	Property = "󰜢",
				-- 	Unit = "󰑭",
				-- 	Value = "󰎠",
				-- 	Enum = "",
				-- 	Keyword = "🅚",
				-- 	Snippet = "",
				-- 	Color = "󰏘",
				-- 	File = "󰈙",
				-- 	Reference = "󰈇",
				-- 	Folder = "󰉋",
				-- 	EnumMember = "",
				-- 	Constant = "󰏿",
				-- 	Struct = "󰙅",
				-- 	Event = "",
				-- 	Operator = "󰆕",
				-- 	TypeParameter = "",
			},
			maxwidth = {
				-- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				-- can also be a function to dynamically calculate max width such as
				-- menu = function() return math.floor(0.45 * vim.o.columns) end,
				menu = 50,   -- leading text (labelDetails)
				abbr = 50,   -- actual suggestion item
			},
			ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			show_labelDetails = true, -- show labelDetails in menu. Disabled by default

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				-- ...
				return vim_item
			end
		})
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		completion = {
			border = "rounded",
			side_padding = 1
		},
		documentation = {
			border = "rounded"
		}
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<cr>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
		{ name = 'nvim_lua' },
		{ name = 'sql' },
	}, {
		{ name = 'buffer' },
	})
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' },
	}, {
		{ name = 'buffer' },
	})
})
require("cmp_git").setup()

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})
