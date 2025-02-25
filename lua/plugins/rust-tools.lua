local function get_codelldb_paths()
  local ok, mason_registry = pcall(require, "mason-registry")
  if not ok then
    return nil, nil
  end

  if not mason_registry.has_package("codelldb") then
    return nil, nil
  end

  local codelldb = mason_registry.get_package("codelldb")
  local extension_path = codelldb:get_install_path() .. "/extension"
  local codelldb_path = extension_path .. "/adapter/codelldb"
  local liblldb_path = extension_path .. "/lldb/lib/liblldb.dylib"

  return codelldb_path, liblldb_path
end

return {
  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
    },
    opts = function()
      local codelldb_path, liblldb_path = get_codelldb_paths()
      return {
        tools = { -- rust-tools options

          -- how to execute terminal commands
          -- options right now: termopen / quickfix
          -- executor = require("rust-tools/executors").termopen,

          -- callback to execute once rust-analyzer is done initializing the workspace
          -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
          on_initialized = nil,

          -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
          reload_workspace_from_cargo_toml = true,

          -- These apply to the default RustSetInlayHints command
          inlay_hints = {
            -- automatically set inlay hints (type hints)
            -- default: true
            auto = true,

            -- Only show inlay hints for the current line
            only_current_line = false,

            -- whether to show parameter hints with the inlay hints or not
            -- default: true
            show_parameter_hints = true,

            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix = "=> ",

            -- whether to align to the lenght of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

            -- The color of the hints
            highlight = "Comment",
          },

          -- options same as lsp hover / vim.lsp.util.open_floating_preview()
          hover_actions = {

            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
              { "╭", "FloatBorder" },
              { "─", "FloatBorder" },
              { "╮", "FloatBorder" },
              { "│", "FloatBorder" },
              { "╯", "FloatBorder" },
              { "─", "FloatBorder" },
              { "╰", "FloatBorder" },
              { "│", "FloatBorder" },
            },

            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = true,
          },

          -- all the opts to send to nvim-lspconfig
          -- these override the defaults set by rust-tools.nvim
          -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
          server = {
            -- standalone file support
            -- setting it to false may improve startup time
            standalone = true,
            settings = {
              ["rust-analyzer"] = {
                imports = {
                  granularity = {
                    group = "module",
                  },
                  prefix = "self",
                },
                cargo = {
                  buildScripts = {
                    enable = true,
                  },
                },
                procMacro = {
                  enable = true,
                },
                -- checkOnSave = {
                --  command = "clippy",
                -- },
              },
            },
          }, -- rust-analyer options

          -- debugging stuff
          dap = {
            adapter = (codelldb_path and liblldb_path)
                and require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
              or nil,
          },
        },
      }
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
}
