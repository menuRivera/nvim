local treesitter = require("nvim-treesitter")

treesitter.setup {}

treesitter.install {
	"bash",
	"c",
	"cpp",
	"dockerfile",
	"go",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"rust",
	"tsx",
	"typescript",
	"vim",
	"vue",
	"yaml",
	"css",
	"scss",
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
