-- Always install some core languages
local core_languages = { 'bash', 'lua', 'markdown', 'vim' }

-- Get project-specific languages from ENV
local env = vim.env.NVIM_TREESITTER_LANGS or ""
local env_languages = vim.split(env, ',', { trimempty = true })

-- Merge several tables into one
local function merge_list_tables(...)
  local result = {}
  local seen = {}

  for i = 1, select("#", ...) do
    local tbl = select(i, ...)
    if type(tbl) == "table" then
      for _, value in ipairs(tbl) do
        if not seen[value] then
          seen[value] = true
          table.insert(result, value)
        end
      end
    end
  end

  return result
end


return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        ensure_installed = merge_list_tables(core_languages, env_languages),
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
}
