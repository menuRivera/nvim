local lsp_defaults = require('lspconfig').util.default_config
local lspconfig = require('lspconfig')

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
lsp_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lsp_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities()
)

-- LspAttach is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
		vim.keymap.set('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
		vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	end,
})

-- hover and signature window style
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	vim.lsp.handlers.hover,
	{
		border = "rounded", -- Options: "single", "double", "rounded", "solid", "shadow", or false.
	}
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
	vim.lsp.handlers.signature_help,
	{
		border = "rounded", -- Options: "single", "double", "rounded", "solid", "shadow", or false.
	}
)

local vue_language_server_path = vim.fn.stdpath('data') ..
	"/mason/packages/vue-language-server/node_modules/@vue/language-server"

lspconfig.ts_ls.setup {
	init_options = {
		plugins = {
			{
				name = '@vue/typescript-plugin',
				location = vue_language_server_path,
				languages = { 'vue' },
			},
		},
	},
	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}

-- No need to set `hybridMode` to `true` as it's the default value
lspconfig.volar.setup {}

require('mason-lspconfig').setup()
