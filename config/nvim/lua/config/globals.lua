_G.punkt = _G.punkt or {}

-- Languages installed by Treesitter
-- (can be extended by project-local `.lazy.lua`)
_G.punkt.treesitter_ensure_installed = {
  'bash',
  'json',
  'lua',
  'markdown',
  'vim',
  'yaml',
}
