-- Language definitions to _always_ have installed (this may be extended by plugin specs in
-- project-local `.lazy.lua` configuration)
local core_languages = {
  'bash',
  'json',
  'lua',
  'markdown',
  'vim',
  'yaml',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = core_languages,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
