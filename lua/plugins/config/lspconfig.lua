local lsp_defaults = require('lspconfig').util.default_config


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

-- I hate you vue-language-server
-- (doesn't work)
require('mason-lspconfig').setup({
	ensure_installed = { 'volar', 'ts_ls' },
	handlers = {
		function(server_name)
			if server_name == 'ts_ls' then
				local vue_typescript_server_path = require('mason-registry').get_package("vue-language-server")
					:get_install_path() ..
					"/node_modules/@vue/language-server"
				require('lspconfig').ts_ls.setup {
					init_options = {
						plugins = {
							{
								name = "@vue/typescript-plugin",
								location = vue_typescript_server_path,
								languages = { "vue", "javascript", "typescript" },
							},
						},
					},
					filetypes = { "javascript", "javascript.jsx", "javascriptreact", "typescript", "typescript.tsx", "typescriptreact", "vue" },
				}
			elseif server_name == 'volar' then
				require('lspconfig').volar.setup {
					filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
				}
			else
				require('lspconfig')[server_name].setup({})
			end
		end,
	}
})
