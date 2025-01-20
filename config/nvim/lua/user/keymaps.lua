-- Basic leader shortcuts
vim.keymap.set('n', '<leader>w', vim.cmd.write, { desc = 'Write buffer' })
vim.keymap.set('n', '<leader>q', vim.cmd.close, { desc = 'Close window' })

-- Toggles
vim.keymap.set('n', '_/', vim.cmd.nohlsearch, { desc = 'Turn off highlight search' })
vim.keymap.set('n', '_ ', ':set list!<CR>', { desc = 'Toggle list chars', silent = true })
