local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local conf = require('telescope.config').values

local M = {}

-- Fetch command history entries from Vim's command history list
local function get_command_history()
  local history = {}
  local length = vim.fn.histnr('cmd')
  for i = 1, length do
    local cmd = vim.fn.histget('cmd', i)
    if cmd ~= '' then
      table.insert(history, cmd)
    end
  end
  return history
end

-- Launch a Telescope picker with command history
function M.command_history_picker()
  pickers.new({}, {
    prompt_title = 'Command History',
    finder = finders.new_table {
      results = get_command_history(),
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      -- Execute the selected command directly
      local function execute_command()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        if selection then
          vim.cmd(selection[1])
        end
      end

      -- Pre-fill the command line with the selected command for editing
      local function edit_command()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        if selection then
          vim.api.nvim_feedkeys(':' .. selection[1], 'n', true)
        end
      end

      map('i', '<CR>', execute_command)
      map('i', '<S-CR>', edit_command)
      map('n', '<CR>', execute_command)
      map('n', '<S-CR>', edit_command)

      return true
    end,
  }):find()
end

return M
