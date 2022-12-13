require("nvim-treesitter.configs").setup {
  context_commentstring = {enable = true},
  highlight = {enable = true, disable = {"markdown"}},
  indent = {
    enable = true,
    disable = {"cpp", "typescript", "typescriptreact", "rust"}
  },
  -- ...
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

