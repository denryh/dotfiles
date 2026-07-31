local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Visual & Aesthetic Choices
config.color_scheme = 'ayu' -- Replace with your favorite theme
config.window_background_opacity = 0.85 -- Semi-transparent background
config.text_background_opacity = 0.9
config.default_prog = { 'zsh', '-l' }

-- Remove heavy window borders/titlebars for a clean floating look
config.window_decorations = 'NONE' 

-- Padding for clean breathing room inside the window
config.window_padding = {
  left = 16,
  right = 16,
  top = 16,
  bottom = 16,
}

-- Typography (Requires a Nerd Font installed on your system)
config.font = wezterm.font_with_fallback({
  'JetBrains Mono',
  'Symbols Nerd Font',
})
config.font_size = 11.0

-- Hide tab bar when only one tab is open
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

return config

