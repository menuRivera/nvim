local get_hex = require('cokeline.hlgroups').get_hl_attr

require('cokeline').setup({
	show_if_buffers_are_at_least = 2,
	fill_hl = 'Directory',
	default_hl = {
		fg = function(buffer)
			return
				buffer.is_focused
				and get_hex('Normal', 'fg')
				or get_hex('Comment', 'fg')
		end,
		bg = 'NONE',
	},
	components = {
		{
			-- index
			text = function(buffer) return (buffer.index ~= 1) and '▏' or '' end,
			fg = function() return get_hex('Normal', 'fg') end
		},
		{
			-- filename
			text = function(buffer) return buffer.filename .. '    ' end,
			fg = function(buffer)
				return buffer.is_focused
					and '#a9b1d6'
					or get_hex('Normal', 'fg')
			end,
			bold = function(buffer) return buffer.is_focused end
		},
	},
})
