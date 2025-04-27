return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
    lazy = false,
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
          })
          if server_name == "lua_ls" then
            require("lspconfig")[server_name].setup({
              settings = {
                Lua = {
                  runtime = { version = "LuaJIT" },
                  diagnostics = { globals = { "vim" } },
                  workspace = {
                    library = { vim.env.VIMRUNTIME },
                  },
                },
              },
            })
          end
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "bash", "astro", "c", "css", "html", "luadoc", "luap", "query", "regex", "tsx", "typescript", "vimdoc", "bash",
          "javascript", "json", "lua", "markdown", "markdown_inline", "python", "vim", "yaml", "julia", "r",
        },
      })
    end,
  },
}

