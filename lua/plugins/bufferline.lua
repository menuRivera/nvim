require('bufferline').setup {
	-- highlights = require("catppuccin.groups.integrations.bufferline").get(),
	options = {
		-- separator_style = 'slope',
		separator_style = 'slant',
		show_buffer_icons = false,
		always_show_bufferline = false,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { 'close' }
		},
		offsets = {
			{
				filetype = "NvimTree",
				text = "",
				text_align = "center",
				separator = true
			}
		},
	}
}
