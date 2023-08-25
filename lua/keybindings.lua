-- Keybindings
-- vim.keymap.set({mode}, {lhs}, {rhs}, {options})
local telescope = require('telescope.builtin')

function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- nvim
map('n', '<leader>w', '<Cmd>w<CR>')
map('n', '<leader>q', '<Cmd>q<CR>')
map('n', '<leader>f', 'gggqG<C-o>') -- fix
map('n', '<CR>', 'i<CR><ESC>')
map('i', '{', '{}<left>')
map('i', '[', '[]<left>')
map('i', '(', '()<left>')
map('i', 'jk', '<C-c>')
map('n', '<C-e>', '<C-e><C-e><C-e>')
map('n', '<C-y>', '<C-y><C-y><C-y>')

-- lsp 
map('n', '<leader>r', '<Cmd>LspRestart<CR>')

-- telescope
map('n', '<C-p>', telescope.find_files)
map('n', '<C-f>', telescope.live_grep)
map('n', '<C-g>', telescope.git_status)
-- nvim-tree
map('n', '<C-h>', '<Cmd>NvimTreeToggle<CR>')

-- Trouble.nvim
map('n', '<C-b>', '<Cmd>TroubleToggle document_diagnostics<CR>')

-- nvim-comment
map({ 'i', 'n' }, '<C-/>', '<Cmd>CommentToggle<CR>')
-- fix: multiple lines comment toggle
-- map('x', '<C-/>', "<Cmd>'<,'>CommentToggle<CR>")

-- bufferline
-- next buffer
map('n', 'gt', '<Cmd>BufferLineCycleNext<CR>')
map('n', 'gl', '<Cmd>BufferLineCycleNext<CR>')
-- previous buffer
map('n', 'gT', '<Cmd>BufferLineCyclePrev<CR>')
map('n', 'gh', '<Cmd>BufferLineCyclePrev<CR>')
-- close buffer
map('n', '<C-w>', '<Cmd>bd<CR>')
-- move buffer next
map('n', 'gL', '<Cmd>BufferLineMoveNext<CR>')
-- move buffer prev
map('n', 'gH', '<Cmd>BufferLineMovePrev<CR>')
