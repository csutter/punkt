-- TODO: Make me dynamic again!
local languages = { 'bash', 'lua', 'markdown', 'vim' }

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        ensure_installed = languages,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
}
