require('onedarkpro').setup({
  options = {
    italic_comments = true,
    italic_keywords = true,
    italic_functions = true,
    italic_variables = false,
    contrast = true,
    sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },
    custom_highlights = {
      NormalFloat = { bg = '#1e222a' },
      FloatBorder = { fg = '#6272a4' },
      Pmenu = { bg = '#1e222a' },
      PmenuSel = { bg = '#44475a' },
      PmenuSbar = { bg = '#6272a4' },
      PmenuThumb = { bg = '#bd93f9' },
    },
  },
})

-- vim.cmd('colorscheme onedark_dark') -- or onedark_vivid or onedark or onelight

