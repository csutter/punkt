return {
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    -- ensure we load colorscheme as quickly as we can
    lazy = false,
    priority = 1000,
    config = function()
      require('github-theme').setup({})

      vim.cmd.colorscheme('github_dark_default')
    end,
  },
  { 'tpope/vim-eunuch' },
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gg', vim.cmd.Git, { desc = 'Fugitive git status' })
    end
  },
  { 'tpope/vim-rhubarb' },
  { 'tpope/vim-unimpaired' },
  { 'tpope/vim-vinegar' },
  {
    'kylechui/nvim-surround',
    version = '*',
    config = function()
      require('nvim-surround').setup()
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup()
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        ensure_installed = {
          'c', 'lua', 'vim', 'vimdoc', 'query', 'bash', 'markdown', 'markdown_inline'
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader><tab>', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Telescope oldfiles' })
      vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = 'Telescope registers' })
    end
  },
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      require('mini.pairs').setup()
      require('mini.tabline').setup()

      require('mini.diff').setup({
        view = {
          style = 'sign',
          signs = { add = '▌', change = '▌', delete = '▁' },
        }
      })

      require('mini.trailspace').setup()
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*',
        callback = function()
          MiniTrailspace.trim()
          MiniTrailspace.trim_last_lines()
        end
      })

      local statusline = require('mini.statusline')
      statusline.setup({
        use_icons = false,
      })
      -- This normally relies on mini.git, which I don't use as it conflicts with the (more
      -- powerful) vim-fugitive - so let's pull out fugitive's statusline.
      statusline.section_git = function()
        return vim.fn['FugitiveStatusline']()
      end
    end
  },
}
