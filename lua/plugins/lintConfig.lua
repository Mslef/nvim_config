vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

return {
  "stevearc/conform.nvim",
  opts = {
    lang_to_ext = {
      typescript = { "ts", "tsx" },
    },
    formatters_by_ft = {
      lua = { "stylua" },
      typescriptreact = { "prettierd" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      html = { "prettierd" },
      go = { "gofumpt" },
    },
  },
}
