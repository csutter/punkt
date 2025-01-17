-- Leader keys
vim.g.mapleader = ' '
vim.g.localleader = '\\'

-- Mouse
vim.opt.mouse = 'a'

-- Colors
-- (colorscheme itself is set in Github theme setup in plugins.lua)
vim.opt.termguicolors = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- Wrapping and ruler
vim.opt.wrap = true
vim.opt.colorcolumn = '100'
vim.opt.textwidth = 100
vim.opt.breakindent = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Gutter
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.relativenumber = true

-- Improve split behaviour
vim.opt.splitbelow = true 
vim.opt.splitright = true
vim.opt.winwidth = 30
vim.opt.winheight = 5

-- File handling settings
vim.opt.eol = true

-- Basic shortcuts
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Write buffer' })
vim.keymap.set('n', '<leader>q', ':close<CR>', { desc = 'Close window' })
vim.keymap.set('n', '<leader>/', ':nohl<CR>', { desc = 'Turn off highlight search' })

require("config.lazy")
