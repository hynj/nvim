return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require "null-ls"

    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.biome,
        null_ls.builtins.formatting.biome.with({
          args = {
            'check',
            '--apply-unsafe',
            '--formatter-enabled=true',
            '--organize-imports-enabled=true',
            '--skip-errors',
            '$FILENAME',
          },
        }),
        null_ls.builtins.diagnostics.biome,
      },
    }
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
