local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font_size = 16
config.color_scheme = "Catppuccin Mocha"

config.window_close_confirmation = "NeverPrompt"

return config
