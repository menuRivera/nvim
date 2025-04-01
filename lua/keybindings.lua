-- Keybindings
-- vim.keymap.set({mode}, {lhs}, {rhs}, {options})
local telescope = require('telescope.builtin')

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- nvim
map('n', '<leader>w', '<cmd>w<cr>')

map('n', '<cr>', 'i<cr><esc>')

map('i', '{', '{}<left>')
map('i', '{<bs>', '')
map('i', '{<leader>', '{}<left><leader><leader><left>')
-- "_ is to send whatever was yanked to register _ (black hole)
map('i', '{<cr>', '{<cr><cr>}<up><c-c>"_cc')

map('i', '[', '[]<left>')
map('i', '[<bs>', '')
map('i', '[<leader>', '[]<left><leader><leader><left>')
map('i', '[<cr>', '[<cr><cr>]<up><c-c>"_cc')

map('i', '(', '()<left>')
map('i', '(<leader>', '()<left><leader><leader><left>')
map('i', '(<bs>', '')

map('i', 'jk', '<C-c>')
map('i', 'Jk', '<C-c>')
map('i', 'jK', '<C-c>')
map('i', 'JK', '<C-c>')

-- scroll
map('n', '<C-e>', '<C-e><C-e><C-e>')
map('n', '<C-y>', '<C-y><C-y><C-y>')

map('n', '<leader>m', '<cmd>MarkdownPreviewToggle<Cr>')

-- lsp
map('n', '<leader>r', '<cmd>LspRestart<cr>')
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
-- map('n', '<leader>f', '<cmd>LspZeroFormat<cr>')

-- telescope
map('n', '<C-p>', telescope.find_files)
map('n', '<C-f>', telescope.live_grep)
-- map('n', '<C-g>', telescope.git_status)

-- gitsigns
map('n', '<leader>b', '<cmd>Gitsigns blame_line<cr>')

-- nvim-tree
map('n', '<C-h>', '<cmd>NvimTreeToggle<cr>')

-- Trouble.nvim
map('n', '<C-b>', '<cmd>TroubleToggle document_diagnostics<cr>')

-- bufferline
-- next buffer
map('n', 'gt', '<cmd>BufferLineCycleNext<cr>')
map('n', 'gl', '<cmd>BufferLineCycleNext<cr>')
-- previous buffer
map('n', 'gT', '<cmd>BufferLineCyclePrev<cr>')
map('n', 'gh', '<cmd>BufferLineCyclePrev<cr>')
-- close buffer
map('n', '<C-w>', '<cmd>bd<cr>')
map('n', 'X', '<cmd>bd<cr>')
-- move buffer next
map('n', 'gL', '<cmd>BufferLineMoveNext<cr>')
-- move buffer prev
map('n', 'gH', '<cmd>BufferLineMovePrev<cr>')


-- treesj
map('n', '<leader>t', '<cmd>TSJToggle<cr>')
map('n', '<leader>s', '<cmd>TSJSplit<cr>')
map('n', '<leader>j', '<cmd>TSJJoin<cr>')

-- snacks
map('n', '<c-g>', '<cmd>lua Snacks.lazygit()<cr>')
map('n', '<leader>de', '<cmd>lua Snacks.dim.enable()<cr>')
map('n', '<leader>dd', '<cmd>lua Snacks.dim.disable()<cr>')
