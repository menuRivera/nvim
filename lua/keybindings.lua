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
map('n', '<CR>', 'i<CR><ESC>')
map('i', '{', '{}<left>')
map('i', '[', '[]<left>')
map('i', '(', '()<left>')
map('i', 'jk', '<C-c>')
map('n', '<C-p>', telescope.find_files)

-- nvim-tree
map('n', '<C-h>', '<Cmd>NvimTreeToggle<CR>')

-- Trouble.nvim
map('n', '<C-b>', '<Cmd>TroubleToggle document_diagnostics<CR>')

-- nvim-comment
map({'i', 'n'}, '<C-/>', '<Cmd>CommentToggle<CR>')
-- fix: multiple lines comment toggle
map('x', '<C-/>', "<Cmd>'<,'>CommentToggle<CR>")

-- bufferline
-- next buffer
map('n', 'gt', '<Cmd>bn<CR>')
-- previous buffer
map('n', 'gT', '<Cmd>bp<CR>')
-- close buffer
map('n', '<C-w>', '<Cmd>bd<CR>')
