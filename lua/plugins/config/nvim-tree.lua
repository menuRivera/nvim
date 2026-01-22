-- local lib = require("nvim-tree.lib")
-- local view = require("nvim-tree.view")

-- Define the custom attachment function
local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- 1. load default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- Custom logic to handle Snacks Zen Mode (floating windows) flawlessly
	local function override_open_behaviour()
		local node = api.tree.get_node_under_cursor()

		-- 1. If it's a folder, let nvim-tree handle expansion/navigation
		if node.type == "directory" then
			api.node.open.edit()
			return
		end

		-- 2. Identify the target window (the one you were in before the tree)
		local last_win = vim.fn.win_getid(vim.fn.winnr('#'))

		if vim.api.nvim_win_is_valid(last_win) then
			local win_config = vim.api.nvim_win_get_config(last_win)

			-- Check if the window is floating (relative is not empty)
			-- This identifies the snacks.zen window
			if win_config.relative ~= "" then
				-- Move focus to the Zen window
				vim.api.nvim_set_current_win(last_win)
				-- Force the file to open in that window, avoiding splits
				vim.cmd("edit " .. vim.fn.fnameescape(node.absolute_path))
				return
			end
		end

		-- 3. Fallback: Standard behavior for tiled windows
		api.node.open.edit()
	end

	-- 2. Apply your custom mappings
	-- We map both <CR> and l to our custom logic so they behave the same
	vim.keymap.set("n", "<CR>", override_open_behaviour, opts("Open (Zen Aware)"))
	vim.keymap.set('n', 'l', override_open_behaviour, opts('Open (Zen Aware)'))

	-- Navigation and Help
	vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Parent'))
	vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
	vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
end

require("nvim-tree").setup { -- BEGIN_DEFAULT_OPTS
	on_attach = on_attach,
	auto_reload_on_write = true,
	create_in_closed_folder = false,
	disable_netrw = false,
	hijack_cursor = true,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	sort_by = "name",
	root_dirs = {},
	prefer_startup_root = false,
	sync_root_with_cwd = false,
	reload_on_bufenter = false,
	respect_buf_cwd = false,
	-- on_attach = "disable",
	-- remove_keymaps = false,
	select_prompts = false,
	view = {
		adaptive_size = true,
		centralize_selection = false,
		width = 20,
		-- hide_root_folder = true,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "no",
		float = {
			enable = true,
			quit_on_focus_loss = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 30,
				height = 40,
				row = 1,
				col = 1,
			},
		},
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = false,
		full_name = false,
		highlight_opened_files = "all",
		-- root_folder_label = ":~:s?$?/..?",
		root_folder_label = false,
		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "after",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = false,
				folder = false,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				folder = {
					arrow_closed = "⏵",
					arrow_open = "⏷",
				}
			}
		},
		special_files = { "Cargo.toml", "Makefile", "package.json" },
		symlink_destination = true,
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = false,
		update_root = false,
		ignore_list = {},
	},
	-- ignore_ft_on_setup = {},
	system_open = {
		cmd = "",
		args = {},
	},
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		-- show_on_open_dirs = true,
		debounce_delay = 50,
		-- severity = {
		-- min = vim.diagnostic.severity.HINT,
		-- max = vim.diagnostic.severity.ERROR
		-- },
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = false,
		custom = {},
		exclude = {},
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
		ignore_dirs = {},
	},
	git = {
		enable = true,
		ignore = false,
		show_on_dirs = false,
		timeout = 400,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = false,
			global = false,
			restrict_above_cwd = true,
		},
		expand_all = {
			max_folder_discovery = 300,
			exclude = {},
		},
		file_popup = {
			open_win_config = {
				col = 1,
				row = 1,
				relative = "cursor",
				border = "shadow",
				style = "minimal",
			},
		},
		open_file = {
			quit_on_open = false,
			resize_window = true,
			window_picker = {
				enable = false,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
		remove_file = {
			close_window = true,
		},
	},
	trash = {
		cmd = "gio trash",
		require_confirm = true,
	},
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true,
	},
	notify = {
		threshold = vim.log.levels.INFO,
	},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			dev = false,
			diagnostics = false,
			git = false,
			profile = false,
			watcher = false,
		},
	},
} -- END_DEFAULT_OPTS

vim.cmd([[
    :hi      NvimTreeExecFile     guifg=#92f5c4 gui=bold
    :hi      NvimTreeSpecialFile  guifg=#b891e3 gui=underline
    :hi      NvimTreeCursorLineNr guifg=#57608a gui=bold
    " :hi      NvimTreeSymlink     guifg=Yellow  gui=italic
    " :hi link NvimTreeImageFile   Title
]])
