local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- Look & feel
config.color_scheme = 'Dark+'
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false

-- Font configuration
config.font = wezterm.font {
  family = 'PragmataPro',
  weight = 400,
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}
config.font_size = 15
config.line_height = 1.4

-- Shortcuts:
config.debug_key_events = true
config.keys = {
  {
    -- Mimic macOS Terminal behaviour
    key = 'k',
    mods = 'CMD',
    action = act.ClearScrollback 'ScrollbackAndViewport',
  },
}

return config
