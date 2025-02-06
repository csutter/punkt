--- Wraps a command using the project command wrapper in `PUNKT_PROJECT_RUN_WRAPPER` (if set).
---
--- This allows us to run various commands in the context of the current project's execution
--- environment, as set up by direnv.
---
--- @param cmd string The command to wrap
--- @return string The wrapped command, or original if no wrapper set
local function wrapped_cmd(cmd)
  local wrapper = vim.env.PUNKT_PROJECT_RUN_WRAPPER
  if not wrapper then
    return cmd
  end
  return string.format(wrapper, cmd)
end

---Creates a command runner that optionally manipulates the window before running the command
---@param manipulate_win? function Function to execute before running the terminal command
---@param command_from_env? string If provided, command will be taken from this environment variable
---@param wrapped? boolean Whether to wrap the command using wrapped_cmd
---@return function Command runner function that accepts nvim command opts
local function create_runner(manipulate_win, command_from_env, wrapped)
  return function(opts)
    if manipulate_win then
      manipulate_win(opts.count)
    end

    local cmd
    if command_from_env then
      if not vim.env[command_from_env] or vim.env[command_from_env] == "" then
        vim.notify(command_from_env .. " environment variable not set or empty", vim.log.levels.ERROR)
        return
      end
      cmd = wrapped and wrapped_cmd(vim.env[command_from_env]) or vim.env[command_from_env]
    else
      cmd = wrapped and wrapped_cmd(opts.args) or opts.args
    end

    vim.cmd.terminal(cmd)
  end
end

local base_runners = {
  ProjectRun = {
    alias = "PR",
    config = {
      nargs = '+',
      complete = 'file',
    },
    wrapped = true
  },
  ProjectTest = {
    alias = "PT",
    config = {},
    command_from_env = "PUNKT_PROJECT_TEST_COMMAND",
    wrapped = true
  },
  ProjectCI = {
    alias = "PC",
    config = {},
    command_from_env = "PUNKT_PROJECT_CI_COMMAND",
    wrapped = true
  },
  ProjectServe = {
    alias = "PS",
    config = {},
    command_from_env = "PUNKT_PROJECT_SERVE_COMMAND",
    wrapped = false
  },
  Term = {
    alias = "T",
    config = {
      nargs = '+',
      complete = 'file',
    },
    wrapped = false
  }
}

local split_prefixes = {
  V = {
    manipulate_win = function(count)
      vim.cmd.vsplit()
      if count and count > 1 then
        vim.api.nvim_win_set_width(0, count)
      end
    end,
    config = {
      count = true
    }
  },
  S = {
    manipulate_win = function(count)
      vim.cmd.split()
      if count and count > 1 then
        vim.api.nvim_win_set_height(0, count)
      end
    end,
    config = {
      count = true
    }
  },
  BR = {
    manipulate_win = function(count)
      vim.cmd('botright split')
      if count and count > 1 then
        vim.api.nvim_win_set_height(0, count)
      end
    end,
    config = {
      count = true
    }
  }
}

local runners = {}
for name, runner in pairs(base_runners) do
  runners[name] = runner

  for prefix, split_config in pairs(split_prefixes) do
    local split_name = prefix .. name
    runners[split_name] = vim.tbl_extend('force', {}, runner, split_config, {
      alias = prefix .. runner.alias,
      config = vim.tbl_extend('force', {}, runner.config, split_config.config)
    })
  end
end

for name, runner in pairs(runners) do
  vim.api.nvim_create_user_command(
    name,
    create_runner(runner.manipulate_win, runner.command_from_env, runner.wrapped),
    runner.config
  )

  if runner.alias then
    vim.keymap.set("ca", runner.alias, name)
  end
end

vim.keymap.set('n', '<C-\\>', ':20BRProjectRun ', { desc = 'Run project command' })
vim.keymap.set('n', '<M-\\>', ':20BRTerm ', { desc = 'Run local command' })
vim.keymap.set('n', '<Leader>tt', ':20BRProjectTest<CR>', { desc = 'Run local command' })
vim.keymap.set('n', '<Leader>tc', ':20BRProjectCI<CR>', { desc = 'Run local command' })
