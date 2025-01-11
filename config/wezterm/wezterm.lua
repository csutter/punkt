local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Look & feel
config.color_scheme = 'Dark+'

-- Font configuration
config.font = wezterm.font {
  family = 'Cascadia Mono',
  weight = 'Regular',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0', 'ss01=1' },
}
config.font_size = 14.0
config.line_height = 1.2

return config
