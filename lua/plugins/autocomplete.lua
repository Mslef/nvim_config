vim.o.completeopt = "menu,noinsert,popup,fuzzy"

local pumMaps = {
  ["<Tab>"] = "<C-n>",
  ["<S-Tab>"] = "<C-p>",
  ["<Down>"] = "<C-n>",
  ["<Up>"] = "<C-p>",
  ["<CR>"] = "<C-y>",
}

for insertKmap, pumKmap in pairs(pumMaps) do
  vim.keymap.set("i", insertKmap, function()
    return vim.fn.pumvisible() == 1 and pumKmap or insertKmap
  end, { expr = true })
end
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method("textDocument/completion") then
      client.server_capabilities.completionProvider.triggerCharacters = vim.split("qwertyuiopasdfghjklzxcvbnm. ", "")
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
    if
        not client:supports_method("textDocument/willSaveWaitUntil")
        and client:supports_method("textDocument/formatting")
    then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
      local _, cancel_prev = nil, function() end
      vim.api.nvim_create_autocmd('CompleteChanged', {
        buffer = args.buf,
        callback = function()
          cancel_prev()
          local info = vim.fn.complete_info({ 'selected' })
          local completionItem = vim.tbl_get(vim.v.completed_item, 'user_data', 'nvim', 'lsp', 'completion_item')
          if nil == completionItem then
            return
          end
          _, cancel_prev = vim.lsp.buf_request(args.buf,
            vim.lsp.protocol.Methods.completionItem_resolve,
            completionItem,
            function(err, item, ctx)
              if not item then
                return
              end
              local docs = (item.documentation or {}).value
              local win = vim.api.nvim__complete_set(info['selected'], { info = docs })
              if win.winid and vim.api.nvim_win_is_valid(win.winid) then
                vim.treesitter.start(win.bufnr, 'markdown')
                vim.wo[win.winid].conceallevel = 3
              end
            end)
        end
      })
    end
  end,
})

return { { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "onsails/lspkind.nvim",
  --     "L3MON4D3/LuaSnip",
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-buffer",
  --     "windwp/nvim-ts-autotag",
  --     "kdheepak/cmp-latex-symbols",
  --     "roobert/tailwindcss-colorizer-cmp.nvim",
  --   },
  --   config = function()
  --     require("nvim-ts-autotag").setup()
  --     local luasnip = require("luasnip")
  --     local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  --     local cmp = require("cmp")
  --     cmp.setup({
  --       sources = {
  --         { name = "nvim_lsp" },
  --         { name = "path" },
  --         { name = "buffer" },
  --         {
  --           name = "latex_symbols",
  --           option = {
  --             strategy = 0,
  --           },
  --         },
  --         { name = "vim-dadbod-completion" },
  --       },
  --       window = { completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered() },
  --       formatting = {
  --         format = function(entry, item)
  --           return require("tailwindcss-colorizer-cmp").formatter(entry, item)
  --         end,
  --       },
  --     })
  --     cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  --   end,
  -- },
}
