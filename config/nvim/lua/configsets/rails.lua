-- Add treesitter language support
table.insert(_G.PunktConfig.settings.treesitter_ensure_installed, "embedded_template")
table.insert(_G.PunktConfig.settings.treesitter_ensure_installed, "html")
table.insert(_G.PunktConfig.settings.treesitter_ensure_installed, "css")
table.insert(_G.PunktConfig.settings.treesitter_ensure_installed, "scss")
table.insert(_G.PunktConfig.settings.treesitter_ensure_installed, "javascript")

-- Rails keymaps
vim.keymap.set('n', '<Leader>rr', ':20SProjectRun bin/rails ', { desc = 'Run Rails command' })
