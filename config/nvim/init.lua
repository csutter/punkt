-- Set <leader> key to space
vim.g.mapleader = " "

-- Basic editor settings
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = 'a'           -- Enable mouse support
vim.opt.ignorecase = true     -- Case insensitive search
vim.opt.smartcase = true      -- But case sensitive when uppercase present
vim.opt.hlsearch = true       -- Highlight search results
vim.opt.wrap = false          -- Don't wrap lines
vim.opt.breakindent = true    -- Preserve indentation in wrapped text
vim.opt.tabstop = 2           -- Width of tab character
vim.opt.shiftwidth = 2        -- Width of indent
vim.opt.expandtab = true      -- Convert tabs to spaces
