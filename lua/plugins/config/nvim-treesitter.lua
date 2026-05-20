require 'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the four listed parsers should always be installed)
	ensure_installed = { "c", "typescript", "javascript", "lua", "vim" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	-- ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}

-- Patch set-lang-from-info-string! to handle invalidated nodes (Neovim 0.12+)
local query = require("vim.treesitter.query")
query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
	local node = match[pred[2]]
	if not node then
		return
	end
	local ok, text = pcall(vim.treesitter.get_node_text, node, bufnr)
	if not ok then
		return
	end
	local ft = vim.filetype.match { filename = "a." .. text:lower() }
	local aliases = { ex = "elixir", pl = "perl", sh = "bash", uxn = "uxntal", ts = "typescript" }
	metadata["injection.language"] = ft or aliases[text:lower()] or text:lower()
end, { force = true })
