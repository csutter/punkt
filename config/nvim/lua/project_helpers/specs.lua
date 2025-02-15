-- Project Helpers: Specs
-- A set of helpers to build plugin specs for `.lazy.lua` that extend plugins from the main config
local M = {}

-- Returns a spec for the Treesitter plugin that extends the options in the main configuration in
-- the `lazy_plugins` module with additional languages.
function M.treesitter(additional_languages)
  return {
    'nvim-treesitter/nvim-treesitter',
    opts_extend = { 'ensure_installed' },
    opts = {
      ensure_installed = additional_languages
    },
  }
end

-- Returns a spec for the project-terminals plugin providing tasks for an app using GOV.UK Docker
function M.project_terminals_govuk_docker(opts)
  assert(vim.env.GOVUK_ROOT_DIR, "project_terminals_govuk_docker_spec: GOVUK_ROOT_DIR must be set")
  assert(opts, "project_terminals_govuk_docker_spec: opts table must be given")
  assert(opts.ci_cmd, "project_terminals_govuk_docker_spec: opts.ci_cmd must be given")
  assert(opts.test_cmd, "project_terminals_govuk_docker_spec: opts.test_cmd must be given")

  local root_dir = vim.env.GOVUK_ROOT_DIR
  local app_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

  local docker_wrapper = 'govuk-docker run --rm --quiet-pull --remove-orphans %s-lite sh -c \'%s\''
  local function govuk_docker_wrapped_command(cmd)
    return string.format(docker_wrapper, app_name, cmd)
  end

  return {
    dir = "~/Developer/project-terminals.nvim",
    opts = {
      tasks = {
        build = {
          cmd = string.format('sh -ic "(cd %s/govuk-docker && make %s)"', root_dir, app_name),
        },
        ci = {
          cmd = govuk_docker_wrapped_command(opts.ci_cmd),
        },
        rails = {
          cmd = function(args)
            local cmd = string.format('bin/rails %s', args)
            return govuk_docker_wrapped_command(cmd)
          end,
        },
        rails_interactive = {
          cmd = function(args)
            local cmd = string.format('bin/rails %s', args)
            return govuk_docker_wrapped_command(cmd)
          end,
          autoclose = true,
        },
        serve = {
          cmd = string.format('govuk-docker up %s-app', app_name),
          persistent = true,
        },
        test = {
          cmd = govuk_docker_wrapped_command(opts.test_cmd),
        }
      }
    }
  }
end

return M
