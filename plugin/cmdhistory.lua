-- plugin/cmdhistory.lua

vim.api.nvim_create_user_command("CommandHistory", function()
  require("cmdhistory").command_history_picker()
end, {})
