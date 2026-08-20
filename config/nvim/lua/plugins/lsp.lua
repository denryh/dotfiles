return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- Install and start language servers.
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "typescript-language-server",
          "lua-language-server",
        },
        automatic_enable = true,
        handlers = {
          -- Default handler: enable capabilities + sensible defaults for
          -- every server Mason installs.
          ["*"] = function(server)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            lspconfig[server].setup({
              capabilities = capabilities,
            })
          end,
        },
      })

      -- LSP keymaps available when a buffer has an attached language server.
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        end,
      })

      -- Nicer default diagnostics signs.
      local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl })
      end
    end,
  },
}