require('conform').setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		javascriptreact = { "prettier" },

		vue = { 'prettier' },
		html = { 'prettier' },
		less = { 'prettier' },
		scss = { 'prettier' },

		lua = { 'stylua' },
		markdown = { 'prettier' },
		json = { 'prettier' },
		yaml = { 'prettier' },
	}
})
