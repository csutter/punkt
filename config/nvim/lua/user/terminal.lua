-- open_terminal(): Open a terminal split in the current tab
--
-- Opens a terminal split in the current tab, optionally with a command.
local function open_terminal(command)
  local win_height = vim.api.nvim_win_get_height(0)
  local term_height = math.max(math.floor(win_height * 0.2), 10)

  vim.cmd('botright ' .. term_height .. 'split')

  if command and command ~= '' then
    vim.cmd('terminal ' .. command)
  else
    vim.cmd('terminal')
  end
end

vim.api.nvim_create_user_command('Term', function(opts)
  open_terminal(opts.args)
end, {
    nargs = '?',  -- Optional argument
    desc = 'Open terminal (optional: with command)',
  })

vim.api.nvim_create_user_command('T', function(opts)
  open_terminal(opts.args)
end, {
    nargs = '?',  -- Optional argument
    desc = 'Open terminal (optional: with command)',
  })
vim.keymap.set('n', '<C-\\>', function() open_terminal() end, { noremap = true, silent = true })

vim.keymap.set('t', '<C-\\><C-\\>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.cmd('startinsert')
  end
})

vim.api.nvim_create_autocmd('TermEnter', {
  pattern = '*',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end
})

vim.api.nvim_create_autocmd('TermLeave', {
  pattern = '*',
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
  end
})
