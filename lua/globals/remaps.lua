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

-- Center screen on cursor
vim.api.nvim_set_keymap("n", "n", "nzzzv", options)
vim.api.nvim_set_keymap("n", "N", "Nzzzv", options)
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zzzv", options)
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zzzv", options)

-- Write and quit
vim.api.nvim_set_keymap("n", "<leader>w", "<cmd>w<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>wq", "<cmd>wq<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>q<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>qa", "<cmd>qa<CR>", options)

-- ChatGPT
vim.api.nvim_set_keymap("n", "<leader>gp", ":ChatGPT<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>ga", ":ChatGPTActAs<CR>", options)
