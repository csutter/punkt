return {
  {
    -- Trim whitespace on write
    'cappyzawa/trim.nvim',
    config = true,
    event = 'VeryLazy',
  },
  {
    -- Shows Git changes in signs column
    'lewis6991/gitsigns.nvim',
    version = '*',
    opts = {
      current_line_blame_opts = {
        virt_text_pos = 'right_align',
      },
    },
  },
  {
    -- Renders indent guides
    'lukas-reineke/indent-blankline.nvim',
    version = '*',
    main = 'ibl',
    config = true,
  },
  {
    -- begin/end insertion
    --   TODO: Evaluate if we still need this once LSP is set up
    'tpope/vim-endwise',
    version = '*',
    event = "InsertEnter",
  },
  {
    -- Helpful filesystem commands
    'tpope/vim-eunuch',
    version = '*',
  },
  {
    -- Git client
    'tpope/vim-fugitive',
    version = '*',
    keys = {
      { '<leader>gg', '<cmd>Git<cr>', desc = 'Fugitive git status' },
      { '<leader>gc', '<cmd>Git checkout ', desc = 'Fugitive git checkout' },
    },
    event = 'VeryLazy',
  },
  {
    -- Github support for `vim-fugitive`
    'tpope/vim-rhubarb',
    version = '*',
    event = 'VeryLazy',
  },
  {
    -- Manage surrounding characters
    'tpope/vim-surround',
    version = '*',
  },
  {
    -- Useful ][ mappings
    'tpope/vim-unimpaired',
    version = '*',
  },
  {
    -- Enhances netrw
    'tpope/vim-vinegar',
    version = '*',
  },
  {
    -- Automatically insert closing brackets etc
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
}
