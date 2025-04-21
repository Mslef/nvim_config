return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({ flavor = "latte" })
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{ "tpope/vim-surround" },
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
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({})
    end,
  },
}
