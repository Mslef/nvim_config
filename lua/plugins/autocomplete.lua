vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

return {
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"onsails/lspkind.nvim",
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"windwp/nvim-ts-autotag",
			"kdheepak/cmp-latex-symbols",
			"roobert/tailwindcss-colorizer-cmp.nvim",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("nvim-ts-autotag").setup()
			local luasnip = require("luasnip")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			local lspkind = require("lspkind").cmp_format({
				mode = "symbol",
				maxwidth = 50,
				ellipsis_char = "...",
				show_labelDetails = true,
			})
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
					{ name = "path" },
					-- { name = "buffer" },
					{
						name = "latex_symbols",
						option = {
							strategy = 0,
						},
					},
					{ name = "vim-dadbod-completion" },
				},
				window = { completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered() },
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({ select = true })
							end
						else
							fallback()
						end
					end),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				formatting = {
					format = function(entry, item)
						lspkind(entry, item)
						return require("tailwindcss-colorizer-cmp").formatter(entry, item)
					end,
				},
			})
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"stevearc/conform.nvim",
		lazy = true,
		opts = {
			lang_to_ext = {
				typescript = { "ts", "tsx" },
			},
			formatters_by_ft = {
				r = { "air" },
				lua = { "stylua" },
				python = { "autopep8" },
				python3 = { "autopep8" },
				typescriptreact = { "prettierd" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				html = { "prettierd" },
				go = { "gofumpt" },
			},
		},
	},
}
