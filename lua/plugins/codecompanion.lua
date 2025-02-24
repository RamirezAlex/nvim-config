local mapping_key_prefix = vim.g.ai_prefix_key or "<leader>m"

require("which-key").register({
  m = {
    name = "CodeCompanion", -- Group name for <leader>m
    a = { "<cmd>CodeCompanionActions<cr>", "Actions" },
    v = { "<cmd>CodeCompanionChat Toggle<cr>", "Toggle Chat" },
    e = { "<cmd>CodeCompanion /explain<cr>", "Explain Code" },
    f = { "<cmd>CodeCompanion /fix<cr>", "Fix Code" },
    l = { "<cmd>CodeCompanion /lsp<cr>", "Explain LSP Diagnostic" },
    t = { "<cmd>CodeCompanion /tests<cr>", "Generate Unit Test" },
    m = { "<cmd>CodeCompanion /commit<cr>", "Git Commit Message" },
    M = { "<cmd>CodeCompanion /staged-commit<cr>", "Staged Commit Message" },
    d = { "<cmd>CodeCompanion /inline-doc<cr>", "Inline Document Code" },
    D = { "<cmd>CodeCompanion /doc<cr>", "Document Code" },
    r = { "<cmd>CodeCompanion /refactor<cr>", "Refactor Code" },
    R = { "<cmd>CodeCompanion /review<cr>", "Review Code" },
    n = { "<cmd>CodeCompanion /naming<cr>", "Better Naming" },
    q = {
      function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          vim.cmd("CodeCompanion " .. input)
        end
      end,
      "Quick Chat",
    },
  },
}, { prefix = "<leader>" })

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
    "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
  },
  config = true,
  opts = {
    strategies = {
      chat = {
        adapter = "copilot",
      },
      inline = {
        adapter = "copilot",
        keymaps = {
          accept_change = {
            modes = { n = "ta" },
            description = "Accept the suggested change",
          },
          reject_change = {
            modes = { n = "tr" },
            description = "Reject the suggested change",
          },
        },
      },
      agent = {
        adapter = "copilot",
      },
    },
    adapters = {
      anthropic = function()
        local api_key = os.getenv("ANTHROPIC_API_KEY")
        return require("codecompanion.adapters").extend("anthropic", {
          env = {
            api_key = api_key,
          },
          schema = {
            model = {
              default = "claude-3-5-sonnet-20241022",
            },
          },
        })
      end,
      openai = function()
        local api_key = os.getenv("OPENAI_API_KEY")
        return require("codecompanion.adapters").extend("openai", {
          env = {
            api_key = api_key,
          },
          schema = {
            model = {
              default = "gpt-4o",
            },
          },
        })
      end,
    },
    display = {
      chat = {
        window = {
          width = 0.35,
        },
      },
    },
    keys = {
      -- Recommend setup
      {
        mapping_key_prefix .. "a",
        "<cmd>CodeCompanionActions<cr>",
        desc = "Code Companion - Actions",
      },
      {
        mapping_key_prefix .. "v",
        "<cmd>CodeCompanionChat Toggle<cr>",
        desc = "Code Companion - Toggle",
        mode = { "n", "v" },
      },
      -- Some common usages with visual mode
      {
        mapping_key_prefix .. "e",
        "<cmd>CodeCompanion /explain<cr>",
        desc = "Code Companion - Explain code",
        mode = "v",
      },
      {
        mapping_key_prefix .. "f",
        "<cmd>CodeCompanion /fix<cr>",
        desc = "Code Companion - Fix code",
        mode = "v",
      },
      {
        mapping_key_prefix .. "l",
        "<cmd>CodeCompanion /lsp<cr>",
        desc = "Code Companion - Explain LSP diagnostic",
        mode = { "n", "v" },
      },
      {
        mapping_key_prefix .. "t",
        "<cmd>CodeCompanion /tests<cr>",
        desc = "Code Companion - Generate unit test",
        mode = "v",
      },
      {
        mapping_key_prefix .. "m",
        "<cmd>CodeCompanion /commit<cr>",
        desc = "Code Companion - Git commit message",
      },
      -- Custom prompts
      {
        mapping_key_prefix .. "M",
        "<cmd>CodeCompanion /staged-commit<cr>",
        desc = "Code Companion - Git commit message (staged)",
      },
      {
        mapping_key_prefix .. "d",
        "<cmd>CodeCompanion /inline-doc<cr>",
        desc = "Code Companion - Inline document code",
        mode = "v",
      },
      { mapping_key_prefix .. "D", "<cmd>CodeCompanion /doc<cr>", desc = "Code Companion - Document code", mode = "v" },
      {
        mapping_key_prefix .. "r",
        "<cmd>CodeCompanion /refactor<cr>",
        desc = "Code Companion - Refactor code",
        mode = "v",
      },
      {
        mapping_key_prefix .. "R",
        "<cmd>CodeCompanion /review<cr>",
        desc = "Code Companion - Review code",
        mode = "v",
      },
      {
        mapping_key_prefix .. "n",
        "<cmd>CodeCompanion /naming<cr>",
        desc = "Code Companion - Better naming",
        mode = "v",
      },
      -- Quick chat
      {
        mapping_key_prefix .. "q",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            vim.cmd("CodeCompanion " .. input)
          end
        end,
        desc = "Code Companion - Quick chat",
      },
    },
  },
}
