return {
  { "EdenEast/nightfox.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "ellisonleao/gruvbox.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_style = "atlantis" -- style options: default, andromeda, atlantis, maia, mirage, shusia, and default
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
      -- colorscheme = "gruvbox",
      -- colorscheme = "rose-pine",
      -- colorscheme = "terafox",
      -- colorscheme = "duskfox",
      -- colorscheme = "carbonfox",
      -- colorscheme = "nightfox",
      -- colorscheme = "nordfox",
      -- colorscheme = "tokyonight",
      -- colorscheme = "sonokai",
    },
  },
}
