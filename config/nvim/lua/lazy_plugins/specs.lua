return {
  {
    'savq/melange-nvim',
    -- ensure we load colorscheme as quickly as we can
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme('melange')
    end,
  },
  { 'tpope/vim-eunuch' },
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gg', vim.cmd.Git, { desc = 'Fugitive git status' })
      vim.keymap.set('n', '<leader>gc', ':Git checkout ', { desc = 'Git checkout' })
    end
  },
  { 'tpope/vim-rhubarb' },
  { 'tpope/vim-unimpaired' },
  { 'tpope/vim-vinegar' },
  { 'tpope/vim-endwise' },
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
    'RRethy/nvim-treesitter-textsubjects',
    config = function()
      require('nvim-treesitter.configs').setup({
        textsubjects = {
          enable = true,
          prev_selection = ',',
          keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = { 'textsubjects-container-inner', desc = "Select inside containers (classes, functions, etc.)" },
          },
        },
      })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        ensure_installed = {},
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

      vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<M-p>', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<C-/>', builtin.live_grep, { desc = 'Telescope live grep' })
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    version = '*',
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = false,
          component_separators = '',
          section_separators = '',
          globalstatus = true,
          always_show_tabline = true,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {
            {
              'filename',
              path = 1,
            },
          },
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        winbar = {
          lualine_b = {
            {
              'filename',
              path = 1,
            },
          },
        },
        inactive_winbar = {
          lualine_b = {
            {
              'filename',
              path = 1,
            },
          },
        },
        tabline = {
          lualine_a = {
            -- Current working directory (and parent for context)
            function()
              local cwd = vim.fn.getcwd()
              return vim.fn.fnamemodify(cwd, ':h:t')..'/'..vim.fn.fnamemodify(cwd, ':t')
            end
          },
          lualine_b = {'branch'},
          lualine_c = {
            {
              'tabs',
              mode = 2,
            },
          },
        },
      })
    end
  },
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      require('mini.pairs').setup()

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
    end
  },
}
