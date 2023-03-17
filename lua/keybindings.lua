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
-- map('i', 'jk', '<ESC>')
map('n', '<leader>w', '<Cmd>w<CR>')
map('n', '<CR>', 'i<CR><ESC>')
map('i', '{', '{}<left>')
map('i', '[', '[]<left>')
map('i', '(', '()<left>')
map('n', '<C-p>', telescope.find_files)

-- nvim-tree
map('n', '<C-h>', '<Cmd>NvimTreeToggle<CR>')

-- nvim-comment
map({'i', 'n'}, '<C-/>', '<Cmd>CommentToggle<CR>')
-- fix
map('x', '<C-/>', "<Cmd>'<,'>CommentToggle<CR>")

-- bufferline
map('n', 'gt', '<Cmd>bn<CR>')
map('n', 'gT', '<Cmd>bp<CR>')
map('n', '<C-w>', '<Cmd>bd<CR>')
