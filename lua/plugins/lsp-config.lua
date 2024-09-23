return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "biome",
          "svelte"
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require "lspconfig"
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
      }
      lspconfig.ts_ls.setup {
        capabilities = capabilities,
        on_attach = function(client)
          -- files which we *really* don't want.
          client.server_capabilities.documentFormattingProvider = false
        end,
      }
      lspconfig.svelte.setup{}
      lspconfig.biome.setup {
        capabilities = capabilities,
      }
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gK", vim.lsp.buf.hover, opts)
    end,
  },
}
