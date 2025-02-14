-- Project Helpers
-- A set of helpers to make local project setup in `.lazy.lua` easier
local M = {}

-- Returns a spec for the Treesitter plugin that extends the options in the main configuration in
-- the `lazy_plugins` module with additional languages.
function M.treesitter_spec(additional_languages)
  return {
    'nvim-treesitter/nvim-treesitter',
    opts_extend = { 'ensure_installed' },
    opts = {
      ensure_installed = additional_languages
    },
  }
end

-- Returns a spec for the project-terminals plugin providing tasks for an app using GOV.UK Docker
function M.project_terminals_govuk_docker_spec(app_name)
  local root_dir = vim.env.GOVUK_ROOT_DIR

  return {
    dir = "~/Developer/project-terminals.nvim",
    opts = {
      tasks = {
        build = {
          cmd = string.format('sh -ic "(cd %s/govuk-docker && make %s)"', root_dir, app_name),
        }
      }
    }
  }
end

return M
