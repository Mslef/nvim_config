return {
  {

    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({})
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
          "bash",
          "astro",
          "c",
          "css",
          "html",
          "luadoc",
          "luap",
          "query",
          "regex",
          "tsx",
          "typescript",
          "vimdoc",
          "bash",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "vim",
          "yaml",
          "julia",
          "r",
        },
      })
    end,
  },
}
