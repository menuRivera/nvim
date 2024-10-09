-- stylua: ignore
local colors = {
	blue   = '#7aa2f7',
	black  = '#080808',
	green  = '#73daca',
	white  = '#c0caf5',
	red    = '#ff6e66',
	yellow = '#e0af68',
	violet = '#bb9af7',
	grey   = '#3c4157',
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.blue, gui = 'bold' },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white },
	},
	insert = {
		a = { fg = colors.black, bg = colors.green, gui = 'bold' }
	},
	visual = {
		a = { fg = colors.black, bg = colors.violet, gui = 'bold' }
	},
	replace = {
		a = { fg = colors.black, bg = colors.red, gui = 'bold' }
	},
	command = {
		a = { fg = colors.black, bg = colors.yellow, gui = 'bold' }
	},
	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.white },
	},
}

require('lualine').setup {
	options = {
		icons_enabled = false,
		theme = bubbles_theme,
		globalstatus = true,
		component_separators = '',
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
		lualine_b = { 'branch', { 'filename', path = 1 }, 'diff', 'diagnostics' },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { 'filetype', 'progress' },
		lualine_z = {
			{ 'location', separator = { right = '' }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
}
