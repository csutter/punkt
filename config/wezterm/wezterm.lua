local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Look & feel
config.color_scheme = 'GitHub Dark'

-- Font configuration
config.font = wezterm.font {
  family = 'PragmataPro',
  weight = 'Regular',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0', 'ss01=on' },
}
config.font_size = 15.0
config.line_height = 1.2

return config
