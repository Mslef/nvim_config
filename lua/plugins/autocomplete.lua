return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		lazy = true,
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		dependencies = {
			"onsails/lspkind.nvim",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"windwp/nvim-ts-autotag",
			"kdheepak/cmp-latex-symbols",
			"roobert/tailwindcss-colorizer-cmp.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			-- require("luasnip.loaders.from_vscode").lazy_load() --TODO : write my own snippets
			require("nvim-ts-autotag").setup()
			local luasnip = require("luasnip")
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
				sources = {
					{ name = "nvim_lsp" },
					{ name = "path" },
					-- { name = "luasnip" },
					{
						name = "buffer",
						option = {
							get_bufnrs = function()
								local bufs = {}
								for _, win in ipairs(vim.api.nvim_list_wins()) do
									bufs[vim.api.nvim_win_get_buf(win)] = true
								end
								return vim.tbl_keys(bufs)
							end,
						},
					},
					{ name = "latex_symbols" },
					{ name = "vim-dadbod-completion" },
				},
				window = { completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered() },
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({
									select = true,
								})
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
				snippet = {
					expand = function(args)
						luasnip.filetype_extend("javascriptreact", { "html" })
						luasnip.lsp_expand(args.body)
					end,
				},
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
