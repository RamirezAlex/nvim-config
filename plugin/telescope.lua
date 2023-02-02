local telescope = require('telescope')

telescope.setup()

telescope.load_extension('fzf')

local options = { noremap = true }

vim.api.nvim_set_keymap('i', 'jk', '<ESC>', options)
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', options)
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>fi', '<cmd>Telescope find_files hidden=true no_ignore=true<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>fr', '<cmd>Telescope resume<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>fs', '<cmd>Telescope grep_string<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', options)

