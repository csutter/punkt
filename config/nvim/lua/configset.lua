-- Loads "configsets" for different languages and projects.
--
-- This is based on the contents of the `PUNKT_NVIM_CONFIGSETS` environment variable, which is
-- expected to contain a comma-separated, ordered list of configsets to include. A configset is
-- simply a Lua module under `configsets/` in my Neovim configuration directory.
--
-- Example:
--   export PUNKT_NVIM_CONFIGSETS=ruby,docker

-- Global configuration table
-- TODO: This should probably live in init.lua?
_G.PunktConfig = _G.PunktConfig or {
  configsets = {},
  settings = {
    -- Enabled languages for Treesitter
    treesitter_ensure_installed = {
      'lua', 'vim', 'vimdoc', 'bash', 'markdown'
    }
  }
}

---Safely requires a configset
---@param module string The name of the configset to require
---@return boolean success Whether the module was loaded successfully
---@return any result The loaded module or error message
local function require_configset(configset_name)
  local module = string.format("configsets.%s", configset_name)

  local ok, _ = pcall(require, module)
  if ok then
    _G.PunktConfig.configsets[configset_name] = true
  else
    vim.notify(
      string.format("Failed to load configset: %s", configset_name),
      vim.log.levels.WARN
    )
  end
end

-- Require all configsets defined for the current project
local configset = vim.env.PUNKT_NVIM_CONFIGSETS
if configset and configset ~= "" then
  for config in configset:gmatch("([^,]+)") do
    configset_name = config:match("^%s*(.-)%s*$")
    require_configset(configset_name)
  end
end

return _G.PunktConfig
