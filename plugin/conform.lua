require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
  },
  formatters = {
    prettier = {
      prepend_args = { "--tab-width", "2", "--use-tabs", "false" },
      -- prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
    },
  },
})

-- in your lazy.nvim config or init.lua
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
  callback = function()
    require("conform").format()
  end,
})

vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true })
end, { desc = "Format file" })

