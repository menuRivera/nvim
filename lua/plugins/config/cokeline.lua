local get_hex = require('cokeline.hlgroups').get_hl_attr

require('cokeline').setup({
	show_if_buffers_are_at_least = 2,
	fill_hl = 'TabLineFill',
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
			-- filename
			text = function(buffer)
				local filename = ""
				if buffer.unique_prefix then
					-- attach unique prefix
					filename = filename .. buffer.unique_prefix .. buffer.filename
				else
					filename = filename .. buffer.filename
				end

				return buffer.is_focused
					and " <" .. filename .. "> "
					or "  " .. filename .. "  " 
			end,


			fg = function(buffer)
				return buffer.is_focused
					and '#918fe5'
					or get_hex('Normal', 'fg')
			end,

			bold = function(buffer) return buffer.is_focused end
		},
	},
})
