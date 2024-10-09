require('telescope').setup {
	pickers = {
		find_files = {
			theme = "dropdown"
		},
	},
	extensions = {
		fzf = true
	}
}
