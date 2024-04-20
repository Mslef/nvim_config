return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind.nvim",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-path",
      "windwp/nvim-ts-autotag",
      "kdheepak/cmp-latex-symbols",
      "roobert/tailwindcss-colorizer-cmp.nvim",
      "rafamadriz/friendly-snippets",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("nvim-ts-autotag").setup()
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      -- Icons
      local lspkind = require("lspkind").cmp_format({
        mode = "symbol",
        maxwidth = 50,
        ellipsis_char = "...",
        show_labelDetails = true,
      })
      cmp.setup({
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "latex_symbols" },
          { name = "vim-dadbod-completion" },
          { name = "path" },
          { name = "luasnip" },
        }),
        window = { completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered() },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<C-tab>"] = cmp.mapping.complete(),
        }),
        -- Autocomplete tab using LuaSnip
        snippet = {
          expand = function(args)
            local luasnip = require("luasnip")
            luasnip.filetype_extend("javascriptreact", { "html" })
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
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
