local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')
local _border = 'rounded'

require('luasnip.loaders.from_vscode').lazy_load()

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
				-- sql = "[SQL]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
			}),
			preset = "codicons",
			symbol_map = {
				-- sql = "",
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
				menu = 50, -- leading text (labelDetails)
				abbr = 50, -- actual suggestion item
			},
			ellipsis_char = '...',
			show_labelDetails = true,

			before = function(entry, vim_item)
				return vim_item
			end
		})
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		completion = {
			border = _border,
			side_padding = 1
		},
		documentation = {
			border = _border
		}
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<cr>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		['<Tab>'] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = 'luasnip' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
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
