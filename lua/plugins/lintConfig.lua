vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

return {
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
}
