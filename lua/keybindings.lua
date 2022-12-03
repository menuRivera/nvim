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

-- nvim-tree
map('n', '<leader>e', '<Cmd>NvimTreeToggle<CR>')

-- bufferline
map('n', 'gt', '<Cmd>bn<CR>')
map('n', 'gT', '<Cmd>bp<CR>')
map('n', '<C-w>', '<Cmd>bd<CR>')
