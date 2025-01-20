-- terminal.lua: Terminal-related configuration

-- Open terminal
vim.keymap.set('n', '<leader>tt', function()
  -- Calculate 20% of total height
  local height = math.min(10, math.floor(vim.o.lines * 0.2))

  -- Create split with specific height
  vim.cmd('botright ' .. height .. 'split')
  vim.cmd('terminal')
  vim.cmd('startinsert')
end, { desc = 'Open terminal in horizontal split' })

-- Close terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<S-Esc>', function()
    vim.api.nvim_win_close(0, true)
end, { desc = 'Close terminal window' })

-- Hide line numbers in terminal mode
vim.api.nvim_create_autocmd('TermEnter', {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
vim.api.nvim_create_autocmd('TermLeave', {
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
  end,
})
