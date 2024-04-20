return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "neovim/nvim-lspconfig",
      "VonHeikemen/lsp-zero.nvim",
      "vigoux/ltex-ls.nvim", -- dictionnary
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
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, {})
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)
    end,
  },
}
