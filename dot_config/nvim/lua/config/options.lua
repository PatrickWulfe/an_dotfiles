-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
if vim.env.VSCODE then
  vim.g.vscode = true
  local vscode = require("vscode")
  local map = LazyVim.safe_keymap_set

  map("n", ",", function()
    vscode.action("runCommands", {
      args = {
        commands = {
          "vspacecode.space",
          {
            command = "whichkey.triggerKey",
            args = "m",
          },
        },
      },
    })
  end, { desc = "VSpaceCode major mode" })
end
