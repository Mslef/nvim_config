-- REPL config
vim.g.slime_target = "tmux"
vim.g.slime_default_config = {
	socket_name = vim.api.nvim_eval('get(split($TMUX, ","), 0)'),
	target_pane = "{top-right}",
}

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
		"kristijanhusak/vim-dadbod-ui",
		dependencies = { "tpope/vim-dadbod", "kristijanhusak/vim-dadbod-completion" },
	},
	{
		"Vigemus/iron.nvim",
		config = function()
			require("iron.core").setup({
				config = {
					repl_open_cmd = "vertical botright 80 split",
				},
				keymaps = {
					send_motion = "<space>rm",
					visual_send = "<space>rv",
					send_file = "<space>rf",
					send_line = "<space>rl",
					send_paragraph = "<space>rp",
					send_until_cursor = "<space>ru",
					send_mark = "<space>rm",
					mark_motion = "<space>mc",
					mark_visual = "<space>mc",
					remove_mark = "<space>md",
					cr = "<space>s<cr>",
					interrupt = "<space>s<space>",
					exit = "<space>rq",
					clear = "<space>cl",
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
		"dgagn/diagflow.nvim",
		-- event = 'LspAttach', This is what I use personnally and it works great
		opts = {
			scope = "line",
			--   config = function()
			--     require("diagflow").setup
			--   end
		},
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
