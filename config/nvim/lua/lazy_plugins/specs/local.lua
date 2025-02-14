return {
  {
    dir = "~/Developer/project-terminals.nvim",
    opts = {
      tasks = {
        echo = {
          cmd = function(args)
            return string.format("echo '%s'", args)
          end,
        },
        hello = {
          cmd = "top",
          persistent = true,
        },
        irb = {
          cmd = "irb",
          interactive = true,
          autoclose = true,
        },
      },
    },
  }
}
