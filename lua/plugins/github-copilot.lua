local copilot_enabled = true

vim.api.nvim_create_user_command("CopilotToggle", function()
  if copilot_enabled then
    vim.cmd("Copilot disable")
    print("Copilot OFF")
  else
    vim.cmd("Copilot enable")
    print("Copilot ON")
  end
  copilot_enabled = not copilot_enabled
end, { nargs = 0 })

vim.keymap.set("", "<leader>ct", ":CopilotToggle<CR>", { noremap = true, silent = true })

return {
  { "github/copilot.vim" },
}
