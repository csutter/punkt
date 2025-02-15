local map = vim.keymap.set

-- Single key shortcuts
map('n', '_', vim.cmd.nohlsearch, { desc = 'Turn off highlight search', silent = true })

-- Window shortcuts
map('n', '<Leader><BS>', ':bdelete<CR>', { desc = 'Delete current buffer', silent = true })
map('n', '<C-;>', '<C-w>w', { silent = true, desc = 'Cycle through windows forwards' })
map('n', '<C-\'>', vim.cmd.tabnext, { silent = true, desc = 'Cycle through tabs forwards' })
map('n', '<C-h>', '<C-w>h', { silent = true, desc = 'Go to left window' })
map('n', '<C-j>', '<C-w>j', { silent = true, desc = 'Go to down window' })
map('n', '<C-k>', '<C-w>k', { silent = true, desc = 'Go to up window' })
map('n', '<C-l>', '<C-w>l', { silent = true, desc = 'Go to right window' })

-- Terminal shortcuts
map('t', '<C-\\><C-\\>', '<C-\\><C-n>', { silent = true, desc = 'Exit terminal mode '})
