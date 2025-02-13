return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      pickers = {
        find_files = {
          find_command = { 'fd', '--type', 'file', '--hidden' },
        },
      },
    },
    keys = {
      { '<C-p>', '<cmd>Telescope find_files<cr>', desc = 'Telescope find files' },
      { '<M-p>', '<cmd>Telescope buffers<cr>', desc = 'Telescope buffers' },
      { '<C-/>', '<cmd>Telescope live_grep<cr>', desc = 'Telescope live grep' },
    },
  },
}
