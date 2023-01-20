return require('packer').startup(function(use)
	-- Packer just manages itself
	use 'wbthomason/packer.nvim'

	-- nvim LSP configs
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'williamboman/nvim-lsp-installer'

	----------------
	-- Plugin development
	----------------
	-- Work in progress. Using upstream by default:
	use 'jpmcb/nvim-go'
	-- If working locally, comment out above 
	-- and uncomment below. Replace path with appropriate working local config
	--use '~/workspace/nvim-go'

	-- Luasnip
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

-- Treesitter is life
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- Gaze deeply into the unknown
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Use fzf native for telescope
	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make'
	}

	-- nvim file tree. Alternative to NerdTree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
	}

  -- Nvim DAP for debugging
  use 'mfussenegger/nvim-dap'
  use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }

	-- Git stuff
	use 'airblade/vim-gitgutter'

  -- Git signs
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

	-- comment stuff out
	use 'preservim/nerdcommenter'

	-- Time Pope is a god
	use 'tpope/vim-surround'
	use 'tpope/vim-fugitive'

  -- Toggle Term
  use {'akinsho/toggleterm.nvim', tag = 'v2.*' }

  -- bufferline
  use 'akinsho/bufferline.nvim'
  use 'moll/vim-bbye'

  use 'christoomey/vim-tmux-navigator'

  -- GitHub CoPilot
  use 'github/copilot.vim'

	-- Yanking manager (yeah yeah I know, registers exist)
	use {
		'AckslD/nvim-neoclip.lua',
		requires = { {'nvim-telescope/telescope.nvim'} },
		config = function()
			require('neoclip').setup()
		end,
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use {
		'goolord/alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.theta'.config)
		end
	}

	--use {
		--'startup-nvim/startup.nvim',
		--requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
		--config = function()
			--require('startup').setup()
		--end,
	--}

	use 'mg979/vim-visual-multi'

	-- Typescript. Oh Typescript. Where art thou Typescript.
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'jose-elias-alvarez/nvim-lsp-ts-utils'

  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Vim Be Good game
  use 'ThePrimeagen/vim-be-good'

  -- Colored brackets
  use 'p00f/nvim-ts-rainbow'

  -- ChatGPT
  use({
  'jackMort/ChatGPT.nvim',
    config = function()
      require('chatgpt').setup({
        -- optional configuration
      })
    end,
    requires = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    }
  })

	-- Colorschemes
	use 'gruvbox-community/gruvbox'
  use 'folke/tokyonight.nvim'
  use { 'https://gitlab.com/__tpb/monokai-pro.nvim', as = 'monokai-pro.nvim' }
  use 'olimorris/onedarkpro.nvim'
  use 'Julpikar/night-owl.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'EdenEast/nightfox.nvim'
  use { 'rose-pine/neovim', as = 'rose-pine-' }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'bluz71/vim-moonfly-colors', as = 'moonfly' }

  vim.cmd.colorscheme 'catppuccin-mocha'

end)

