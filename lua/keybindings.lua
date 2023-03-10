-- Keybindings
-- vim.keymap.set({mode}, {lhs}, {rhs}, {options})

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- nvim
map('i', 'jk', '<ESC>')
map('n', '<leader>w', '<Cmd>w<CR>')
map('n', '<CR>', 'i<CR><ESC>')
map('i', '{', '{}<left>')
map('i', '[', '[]<left>')
map('i', '(', '()<left>')

-- nvim-tree
map('n', '<C-h>', '<Cmd>NvimTreeToggle<CR>')

-- bufferline
map('n', 'gt', '<Cmd>bn<CR>')
map('n', 'gT', '<Cmd>bp<CR>')
map('n', '<C-w>', '<Cmd>bd<CR>')
