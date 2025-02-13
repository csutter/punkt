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
}
