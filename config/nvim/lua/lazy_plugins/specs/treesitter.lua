-- Treesitter language definitions are installed based on the contents of
-- `_G.punkt.treesitter_ensure_installed`, which is defined in `config/globals.lua`
-- and intended to be inserted into by project-local `.lazy.lua` config files.
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        ensure_installed = _G.punkt.treesitter_ensure_installed,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
}
