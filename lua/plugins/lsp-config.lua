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

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = true
        end,
      })

      vim.lsp.config("svelte", {
        capabilities = capabilities,
      })

      vim.lsp.config("biome", {
        capabilities = capabilities,
      })

      vim.lsp.enable({ "lua_ls", "ts_ls", "svelte", "biome" })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover LSP" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename variable" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
    end,
  },
}
