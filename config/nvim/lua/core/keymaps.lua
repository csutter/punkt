-- Single key shortcuts
vim.keymap.set('n', '_', vim.cmd.nohlsearch, { desc = 'Turn off highlight search', silent = true })

-- Window shortcuts
vim.keymap.set('n', '<Leader><BS>', ':bdelete<CR>', { desc = 'Delete current buffer', silent = true })
vim.keymap.set("n", "<C-;>", "<C-w>w", { silent = true, desc = "Cycle through windows forwards" })
vim.keymap.set("n", "<C-'>", vim.cmd.tabnext, { silent = true, desc = "Cycle through tabs forwards" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true, desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true, desc = "Go to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true, desc = "Go to up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true, desc = "Go to right window" })

-- Terminal shortcuts
vim.keymap.set("t", "<C-\\><C-\\>", "<C-\\><C-n>", { silent = true, desc = "Exit terminal mode "})
