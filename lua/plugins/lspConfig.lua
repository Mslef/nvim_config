return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"neovim/nvim-lspconfig",
			"vigoux/ltex-ls.nvim", -- dictionnary
		},
		lazy = false,
		config = function()
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
					default_setup,
					lua_ls = function()
						lspconfig.lua_ls.setup({
							settings = {
								Lua = {
									runtime = {
										version = "LuaJIT",
									},
									diagnostics = {
										globals = { "vim" },
									},
									workspace = {
										library = {
											vim.env.VIMRUNTIME,
										},
									},
								},
							},
						})
					end,
					tsserver = lspconfig.tsserver.setup({}),
					astro = lspconfig.astro.setup({}),
					r_language_server = lspconfig.r_language_server.setup({}),
					-- ltex = lspconfig.ltex.setup({}),
				},
			})
		end,
	},
}
