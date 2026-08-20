return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- Update all installed parsers when the plugin is updated.
    build = ":TSUpdate",
    config = function()
      -- Enable native treesitter highlighting for buffers whose parser is
      -- installed (no-op, guarded via pcall, for the rest).
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          pcall(vim.treesitter.start, ev.buf)
        end,
      })

      -- Modern nvim-treesitter: parsers are installed explicitly and are
      -- separate from plugin config (the old nvim-treesitter.configs module
      -- was removed).
      require("nvim-treesitter").setup()

      -- Install parsers for the languages we use. Already-installed parsers
      -- are a no-op, so this only does work on first setup.
      require("nvim-treesitter").install({
        "lua",
        "nix",
        "vim",
        "vimdoc",
        "bash",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
      }):wait(300000)
    end,
  },
}