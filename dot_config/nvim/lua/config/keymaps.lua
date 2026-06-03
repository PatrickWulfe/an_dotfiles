-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
if vim.env.VSCODE or vim.g.vscode then
  local vscode = require("vscode")
  local map = (LazyVim and LazyVim.safe_keymap_set) or vim.keymap.set

  map("n", ",", function()
    local ok, err = pcall(function()
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
    end)
    if not ok then
      vim.notify("error in ',' mapping: " .. tostring(err), vim.log.levels.ERROR)
    end
  end, { desc = "VSpaceCode major mode" })

end
