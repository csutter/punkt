-- Set <leader> key to space
vim.g.mapleader = " "

-- Basic editor settings
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = 'a'           -- Enable mouse support
vim.opt.ignorecase = true     -- Case insensitive search
vim.opt.smartcase = true      -- But case sensitive when uppercase present
vim.opt.hlsearch = true       -- Highlight search results
vim.opt.wrap = true           -- Wrap lines
vim.opt.colorcolumn = '100'   -- Ruler
vim.opt.textwidth = 100       -- Soft wrap width
vim.opt.breakindent = true    -- Preserve indentation in wrapped text
vim.opt.tabstop = 2           -- Width of tab character
vim.opt.shiftwidth = 2        -- Width of indent
vim.opt.expandtab = true      -- Convert tabs to spaces

-- File handling settings
vim.opt.eol = true  -- Ensure files end with newline

-- Basic shortcuts
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Write buffer' })
vim.keymap.set('n', '<leader>vr', ':source $MYVIMRC<CR>', { desc = 'Re-source configuration' })
