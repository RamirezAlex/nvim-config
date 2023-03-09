local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- nvim LSP configs
	'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'williamboman/nvim-lsp-installer',
  'jpmcb/nvim-go',
    -- Luasnip
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  -- Treesitter is life
  {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	},
	-- Gaze deeply into the unknown
  {
		'nvim-telescope/telescope.nvim',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},
	-- Use fzf native for telescope
  {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make'
	},
	-- nvim file tree. Alternative to NerdTree
  {
		'kyazdani42/nvim-tree.lua',
		dependencies = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
	},
  -- Nvim DAP for debugging
  'mfussenegger/nvim-dap',
  { 'rcarriga/nvim-dap-ui', dependencies = {'mfussenegger/nvim-dap'} },
	-- Git stuff
  'airblade/vim-gitgutter',
  -- Git signs
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  'christoomey/vim-tmux-navigator',
  -- comment stuff out
  'preservim/nerdcommenter',
  -- Time Pope is a god
  'tpope/vim-surround',
  'tpope/vim-fugitive',
  -- Toggle Term
  {'akinsho/toggleterm.nvim', tag = 'v2.*' },
  -- bufferline
  'akinsho/bufferline.nvim',
  'moll/vim-bbye',
  -- GitHub CoPilot
  'github/copilot.vim',
  -- Yanking manager (yeah yeah I know, registers exist)
  {
		'AckslD/nvim-neoclip.lua',
		dependencies = { {'nvim-telescope/telescope.nvim'} },
		config = function()
			require('neoclip').setup()
		end,
	},
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
  },
  {
		'goolord/alpha-nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.theta'.config)
		end
	},
  'mg979/vim-visual-multi',
	-- Typescript. Oh Typescript. Where art thou Typescript.
  'jose-elias-alvarez/null-ls.nvim',
  'jose-elias-alvarez/nvim-lsp-ts-utils',
  'numToStr/Comment.nvim',
  'JoosepAlviste/nvim-ts-context-commentstring',
  -- Vim Be Good game
  'ThePrimeagen/vim-be-good',
  -- Colored brackets
  'p00f/nvim-ts-rainbow',
  -- ChatGPT
  {
  'jackMort/ChatGPT.nvim',
    config = function()
      require('chatgpt').setup({
        -- optional configuration
      })
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    }
  },
  -- Markdown preview
  'iamcco/markdown-preview.nvim',
	-- Colorschemes
	'gruvbox-community/gruvbox',
  'folke/tokyonight.nvim',
  { 'https://gitlab.com/__tpb/monokai-pro.nvim', as = 'monokai-pro.nvim' },
  'olimorris/onedarkpro.nvim',
  'Julpikar/night-owl.nvim',
  'Mofiqul/dracula.nvim',
  'EdenEast/nightfox.nvim',
  { 'rose-pine/neovim', as = 'rose-pine-' },
  { 'catppuccin/nvim', as = 'catppuccin' },
  { 'bluz71/vim-moonfly-colors', as = 'moonfly' },
  { 'embark-theme/vim', as = 'embark' },
  'rebelot/kanagawa.nvim',
  'sainnhe/everforest',
}

local opts = {}

require('lazy').setup(plugins, opts)

vim.cmd.colorscheme 'catppuccin-mocha'

