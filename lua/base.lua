vim.o.relativenumber = true
vim.o.number = true
vim.o.winborder = "rounded" -- Options: "single", "double", "rounded", "solid", "shadow", or false.
-- vim.o.guibg = 'none'
vim.opt.encoding = "utf-8"
vim.scriptencoding = "utf-8"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.tabstop = 4
vim.opt.scrolloff = 5
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.shortmess:append("cWI")
-- vim.opt.cmdheight = 0
-- vim.opt.smartindent = true
-- vim.opt.cindent = true
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
-- vim.opt.expandtab = true

-- Plugins adviced settings
vim.g.loaded_newtrw = 1
vim.g.loaded_newtrwPlugin = 1
vim.opt.termguicolors = true

-- Match Kitty's Tokyo Night ANSI colors (kitty.conf lines 1165-1194)
vim.g.terminal_color_0 = "#414868"
vim.g.terminal_color_1 = "#f7768e"
vim.g.terminal_color_2 = "#73daca"
vim.g.terminal_color_3 = "#e0af68"
vim.g.terminal_color_4 = "#7aa2f7"
vim.g.terminal_color_5 = "#bb9af7"
vim.g.terminal_color_6 = "#7dcfff"
vim.g.terminal_color_7 = "#c0caf5"
vim.g.terminal_color_8 = "#414868"
vim.g.terminal_color_9 = "#f7768e"
vim.g.terminal_color_10 = "#73daca"
vim.g.terminal_color_11 = "#e0af68"
vim.g.terminal_color_12 = "#7aa2f7"
vim.g.terminal_color_13 = "#bb9af7"
vim.g.terminal_color_14 = "#7dcfff"
vim.g.terminal_color_15 = "#c0caf5"

-- diagnostics
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
})

-- folds
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldlevelstart = 99
-- vim.filetype.add({
-- 	extension = {
-- 		nr = 'noir'
-- 	}
-- })

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
