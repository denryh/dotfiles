-- lazy.nvim options. Plugin specs are loaded from lua/plugins/.
return {
  install = {
    -- Fallback colorscheme used while lazy is installing plugins.
    colorscheme = { "catppuccin" },
  },
  ui = {
    border = "rounded",
  },
  checker = {
    -- Check for plugin updates on startup.
    enabled = true,
    notify = false,
  },
}