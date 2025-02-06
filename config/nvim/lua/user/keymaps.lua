-- Basic leader shortcuts
vim.keymap.set('n', '<leader>w', vim.cmd.write, { desc = 'Write buffer' })
vim.keymap.set('n', '<leader>h', vim.cmd.hide, { desc = 'Hide buffer' })

-- Single key shortcuts
vim.keymap.set('n', '_', vim.cmd.nohlsearch, { desc = 'Turn off highlight search', silent = true })

-- Window shortcuts
vim.keymap.set('n', '<C-Q>', ':close<CR>', { desc = 'Close current window', silent = true })

-- Disable arrow keys for insert and visual mode, to wean myself off
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')
vim.keymap.set('v', '<Up>', '<Nop>')
vim.keymap.set('v', '<Down>', '<Nop>')
vim.keymap.set('v', '<Left>', '<Nop>')
vim.keymap.set('v', '<Right>', '<Nop>')
