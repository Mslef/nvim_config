return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({ flavor = "frappe" })
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "ryanoasis/vim-devicons" },
		config = function()
			require("lualine").setup({
				theme = "nightfly",
				sections = {
					lualine_a = { "" },
					lualine_b = { "" },
					lualine_c = { "" },
					lualine_x = { "filename", "filetype" },
					lualine_y = { "branch", "diff", "searchcount" },
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
	},
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup({})
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
	{
		"folke/noice.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		event = "VeryLazy",
		config = function()
			require("notify").setup({ background_colour = "#000000" })
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
