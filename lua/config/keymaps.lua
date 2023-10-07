-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local options = { noremap = true }

-- Change panes on vim ctrl mappings
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", options)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", options)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", options)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", options)

-- Escape maps to a rolling jk
vim.api.nvim_set_keymap("i", "jk", "<ESC>", options)
vim.api.nvim_set_keymap("i", "jj", "<ESC>", options)
vim.api.nvim_set_keymap("i", "jk", "<ESC>", options)
vim.api.nvim_set_keymap("i", "jj", "<ESC>", options)

-- Navigate buffers
vim.api.nvim_set_keymap("n", "<S-l>", ":bnext<CR>", options)
vim.api.nvim_set_keymap("n", "<S-h>", ":bprevious<CR>", options)

-- Clear highlights
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", options)

-- Close buffers
vim.api.nvim_set_keymap("n", "<S-q>", "<cmd>bdelete!<CR>", options)

-- Center screen on cursor
vim.api.nvim_set_keymap("n", "n", "nzzzv", options)
vim.api.nvim_set_keymap("n", "N", "Nzzzv", options)
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zzzv", options)
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zzzv", options)

-- Write and quit
vim.api.nvim_set_keymap("n", "<leader>ww", "<cmd>w<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>wq", "<cmd>wq<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>q<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>qa", "<cmd>qa<CR>", options)

-- ChatGPT
vim.api.nvim_set_keymap("n", "<leader>gp", ":ChatGPT<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>ga", ":ChatGPTActAs<CR>", options)

-- Copilot
vim.api.nvim_set_keymap(
  "i",
  "<C-j>",
  [[copilot#Accept("\<CR>")]],
  { noremap = true, silent = true, script = true, expr = true }
)

-- vim tmux navigator
vim.api.nvim_set_keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", options)
vim.api.nvim_set_keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", options)
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", options)
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", options)

-- rust tools
vim.api.nvim_set_keymap(
  "n",
  "R",
  "<cmd>lua require'rust-tools'.hover_actions.hover_actions()<CR>",
  { noremap = true, desc = "Show hover actions" }
)

-- flutter tools
vim.api.nvim_set_keymap("n", "FR", "<cmd>FlutterRun<CR>", { noremap = true, desc = "Flutter Run" })

-- telescope
vim.api.nvim_set_keymap(
  "n",
  "<leader>fg",
  "<cmd>lua require('telescope.builtin').live_grep()<CR>",
  { noremap = true, desc = "Find string in project" }
)

-- rest.nvim mappings
vim.api.nvim_set_keymap("n", "<leader>ht", "<Plug>RestNvim<CR>", { noremap = true, desc = "HTTP Request" })
vim.api.nvim_set_keymap(
  "n",
  "<leader>hp",
  "<Plug>RestNvimPreview<CR>",
  { noremap = true, desc = "HTTP Request Preview" }
)
vim.api.nvim_set_keymap("n", "<leader>hl", "<Plug>RestNvimLast<CR>", { noremap = true, desc = "HTTP Request Last" })
