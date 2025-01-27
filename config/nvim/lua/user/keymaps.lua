-- Basic leader shortcuts
vim.keymap.set('n', '<leader>w', vim.cmd.write, { desc = 'Write buffer' })
vim.keymap.set('n', '<leader>q', vim.cmd.bdelete, { desc = 'Close window' })

-- Toggles
vim.keymap.set('n', '_/', vim.cmd.nohlsearch, { desc = 'Turn off highlight search' })
vim.keymap.set('n', '_ ', ':set list!<CR>', { desc = 'Toggle list chars', silent = true })

-- Disable arrow keys for insert and visual mode, to wean myself off
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')
vim.keymap.set('v', '<Up>', '<Nop>')
vim.keymap.set('v', '<Down>', '<Nop>')
vim.keymap.set('v', '<Left>', '<Nop>')
vim.keymap.set('v', '<Right>', '<Nop>')
