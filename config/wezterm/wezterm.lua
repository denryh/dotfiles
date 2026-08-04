local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

local config = wezterm.config_builder()

-- Visual & Aesthetic Choices
config.color_scheme = 'ayu' -- Replace with your favorite theme
config.window_background_opacity = 0.98 -- Semi-transparent background
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

-- Window size upon opening
config.initial_cols = 120
config.initial_rows = 35

-- Typography (Requires a Nerd Font installed on your system)
config.font = wezterm.font('GeistMono Nerd Font Mono',{ weight = 'SemiBold' })

config.font_size = 10.0

-- Hide tab bar when only one tab is open
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

return config

