return {
  {
    'nikolvs/vim-sunbather',
    -- ensure we load colorscheme as quickly as we can
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('sunbather')
    end,
  },
  { 'tpope/vim-commentary' },
  { 'tpope/vim-eunuch' },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-vinegar' },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
}
