-- Project Helpers: Keymaps
-- A set of helpers to set key mappings in `.lazy.lua`
local M = {}

local map = vim.keymap.set
local function ns(from, to, desc)
  vim.keymap.set('n', from, to, { silent = true, desc = desc })
end

function M.project_terminals_general()
  ns('<leader>tb', '<cmd>Task build<cr>', 'Run build task')
  ns('<leader>tc', '<cmd>Task ci<cr>', 'Run CI task')
  ns('<leader>ts', '<cmd>Task serve<cr>', 'Run serve task')
  ns('<leader>tt', '<cmd>Task test<cr>', 'Run test task')
end

function M.project_terminals_rails()
  ns('<leader>rc', '<cmd>Task rails_interactive console<cr>', 'Run Rails console task')
  ns('<leader>rd', '<cmd>Task rails_interactive dbconsole<cr>', 'Run Rails dbconsole task')
  ns('<leader>ro', '<cmd>Task rails routes<cr>', 'Run Rails routes task')
  ns('<leader>rr', '<cmd>Task rails ', 'Run arbitrary Rails task')
end

return M
