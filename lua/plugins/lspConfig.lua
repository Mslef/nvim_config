return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "neovim/nvim-lspconfig",
      "VonHeikemen/lsp-zero.nvim",
    },
    lazy = false,
    config = function()
      local lsp_zero = require("lsp-zero")
      local lspconfig = require("lspconfig")
      require("mason").setup()
      local default_setup = function(server)
        lspconfig[server].setup({
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          diagnostics = { globals = { "vim" } },
        })
      end
      require("mason-lspconfig").setup({
        ensure_installed = { "tsserver", "lua_ls" },
        handlers = {
          lsp_zero.default_setup,
          default_setup,
          lua_ls = function()
            lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
          end,
          tsserver = lspconfig.tsserver.setup({}),
          ltex = lspconfig.ltex.setup({}),
        },
      })
      lsp_zero.extend_lspconfig()
      lsp_zero.set_sign_icons({
        error = "✘",
        warn = "▲",
        hint = "⚑",
        info = "»",
      })
      lsp_zero.on_attach(function(client, bufnr)
        -- Keymaps for lsp functionality
        vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", {})
        vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", {})
        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", {})
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)
    end,
  },
  {
    "vigoux/ltex-ls.nvim",
  },
}
