local telescope = require('telescope')
telescope.load_extension('fzf')
telescope.setup {
	defaults = {
		color_devicons = false,
	},
	pickers = {
		find_files = {
			theme = "dropdown"
		},
	},
	extensions = {
		fzf = true
	}
}
