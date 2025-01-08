return {
  'projekt0n/github-nvim-theme',
  -- ensure we load colorscheme as quickly as we can
  lazy = false,
  priority = 1000,
  config = function()
    require('github-theme').setup({
      options = {
        hide_end_of_buffer = false,
        dim_inactive = true,
        styles = {
          comments = 'italic',
          keywords = 'bold',
        },
      },
    })
    vim.cmd.colorscheme('github_dark_default')
  end,
}
