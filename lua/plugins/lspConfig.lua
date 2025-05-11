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
					require("lspconfig").lua_ls.setup({
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
					require("lspconfig").r_language_server.setup({
						on_attach = function(client, _)
							client.server_capabilities.documentFormattingProvider = false
							client.server_capabilities.documentRangeFormattingProvider = false
						end,
					})
					require("lspconfig").air.setup({
						on_attach = function(_, bufnr)
							vim.api.nvim_create_autocmd("BufWritePre", {
								buffer = bufnr,
								callback = function()
									vim.lsp.buf.format()
								end,
							})
						end,
					})
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
					"bash",
					"css",
					"html",
					"tsx",
					"typescript",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"yaml",
					"julia",
					"r",
					"templ",
					"zig",
				},
			})
		end,
	},
}
