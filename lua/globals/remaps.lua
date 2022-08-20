local options = { noremap = true }

-- Change panes on vim ctrl mappings
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', options)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', options)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', options)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', options)

-- Escape maps to a rolling jk
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', options)
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', options)
-- Navigate buffers
vim.api.nvim_set_keymap("n", "<S-l>", ":bnext<CR>", options)
vim.api.nvim_set_keymap("n", "<S-h>", ":bprevious<CR>", options)

-- Clear highlights
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", options)

-- Close buffers
vim.api.nvim_set_keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", options)


