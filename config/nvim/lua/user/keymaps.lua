-- Basic leader shortcuts
vim.keymap.set('n', '<leader>w', vim.cmd.write, { desc = 'Write buffer' })
vim.keymap.set('n', '<leader>q', vim.cmd.close, { desc = 'Close window' })

-- Toggles
vim.keymap.set('n', '_/', vim.cmd.nohlsearch, { desc = 'Turn off highlight search' })
vim.keymap.set('n', '_ ', ':set list!<CR>', { desc = 'Toggle list chars', silent = true })

-- Window navigation
vim.keymap.set('n', '<C-H>', '<C-w>h', { desc = 'Focus on left window' })
vim.keymap.set('n', '<C-J>', '<C-w>j', { desc = 'Focus on below window' })
vim.keymap.set('n', '<C-K>', '<C-w>k', { desc = 'Focus on above window' })
vim.keymap.set('n', '<C-L>', '<C-w>l', { desc = 'Focus on right window' })

-- Window resizing
vim.keymap.set('n', '<C-S-h>', '<C-w><', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-S-j>', '<C-w>-', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-S-k>', '<C-w>+', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-S-l>', '<C-w>>', { desc = 'Increase window width' })
