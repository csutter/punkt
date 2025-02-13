return {
  {
    'nvim-lualine/lualine.nvim',
    version = '*',
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = false,
          component_separators = '',
          section_separators = '',
          globalstatus = true,
          always_show_tabline = true,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {
            {
              'filename',
              path = 1,
            },
          },
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        winbar = {
          lualine_b = {
            {
              'filename',
              path = 1,
            },
          },
        },
        inactive_winbar = {
          lualine_b = {
            {
              'filename',
              path = 1,
            },
          },
        },
        tabline = {
          lualine_a = {
            -- Current working directory (and parent for context)
            function()
              local cwd = vim.fn.getcwd()
              return vim.fn.fnamemodify(cwd, ':h:t')..'/'..vim.fn.fnamemodify(cwd, ':t')
            end
          },
          lualine_b = {'branch'},
          lualine_c = {
            {
              'tabs',
              mode = 2,
            },
          },
        },
      })
    end
  },
}
