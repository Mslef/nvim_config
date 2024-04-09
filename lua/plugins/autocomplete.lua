return {
  -- Autocomplete
  "hrsh7th/nvim-cmp",
  dependencies = {
    "onsails/lspkind.nvim",
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-path",
    "kdheepak/cmp-latex-symbols",
    "roobert/tailwindcss-colorizer-cmp.nvim",
    "Exafunction/codeium.nvim",
    "rafamadriz/friendly-snippets",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local luasnip = require("luasnip")
    luasnip.filetype_extend("javascriptreact", { "html" })
    require("luasnip.loaders.from_vscode").lazy_load()
    require("codeium").setup({ enable_chat = true })
    local cmp = require("cmp")
    -- Icons
    local lspkind = require("lspkind").cmp_format({
      mode = "symbol",
      maxwidth = 50,
      ellipsis_char = "...",
      show_labelDetails = true,
    })
    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
        { name = "latex_symbols" },
        { name = "vim-dadbod-completion" },
        { name = "path" },
        { name = "codeium" },
      },
      -- Keymappings for autocomplete
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<leader>c"] = cmp.mapping.complete(),
      }),
      -- Autocomplete tab using LuaSnip
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      -- Formatting
      formatting = {
        format = function(entry, item)
          lspkind(entry, item)
          -- Tailwind color swatches
          return require("tailwindcss-colorizer-cmp").formatter(entry, item)
        end,
      },
    })
  end,
}
