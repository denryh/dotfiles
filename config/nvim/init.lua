-- Entry point for Neovim. Loaded by nvim on startup from ~/.config/nvim.

-- ----------------------------------------------------------------------------
-- Bootstrap lazy.nvim if it is not installed yet.
-- ----------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ----------------------------------------------------------------------------
-- Core configuration.
-- ----------------------------------------------------------------------------
require("config.options")
require("config.keymaps")

-- ----------------------------------------------------------------------------
-- Plugins. The plugin specs live in lua/plugins/ and are loaded by lazy.nvim.
-- ----------------------------------------------------------------------------
require("lazy").setup("plugins", require("config.lazy"))