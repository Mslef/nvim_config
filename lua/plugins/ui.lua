return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({ flavor = "latte" })
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				tailwind = true,
			},
		},
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = { "tpope/vim-dadbod", "kristijanhusak/vim-dadbod-completion" },
	},
	{ "tpope/vim-surround" },
	{
		"tpope/vim-fugitive",
	},
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({})
		end,
	},
	{
		"folke/noice.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		event = "VeryLazy",
		config = function()
			-- require("notify").setup({ background_colour = "#000000" })
			require("noice").setup({
				cmdline = {
					opts = {
						relative = "editor",
						position = "5%",
					},
				},
				lsp = {
					progress = {
						enabled = false,
					},
				},
			})
		end,
	},
}
