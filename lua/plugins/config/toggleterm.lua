require'toggleterm'.setup{
	shade_terminals = false,
	open_mapping = [[<c-`>]],
	hide_numbers = true,
	direction = 'float',
	autochdir = true,
	float_opts = {
		border = 'curved',
		winblend = 8,
	},
	highlights = {
		NormalFloat = { link = "NormalFloat" },
		FloatBorder = { link = "FloatBorder" },
	},
}

-- local Terminal = require'toggleterm.terminal'.Terminal

-- local terminal = Terminal:new({
	-- direction = 'float',
	-- float_opts = {
		-- border = 'double'
	-- }
-- })
