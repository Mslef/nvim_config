vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.md",
	callback = function(args)
		require("zen-mode").reset({})
		-- vim.api.nvim_open_win(0, true, { relative = "win", row = 3, col = 3, width = 12, height = 3 })
		vim.cmd("set norelativenumber nonumber")
		vim.cmd("LspStop")
	end,
})

return {
	{
		"folke/zen-mode.nvim",
		dependencies = { "folke/twilight.nvim" },
		opts = {
			window = { width = 0.8 },
			plugins = { tmux = { enabled = true } },
		},
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = false,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("obsidian").setup({
				workspaces = {
					{
						name = "Notes",
						path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents",
					},
				},
				completion = {
					nvim_cmp = true,
					min_char = 2,
				},
				notes_subdir = "notes",
				note_id_func = function(title)
					if title ~= nil then
						return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
					else
						return os.date("%d%m%Y%H%M")
					end
				end,
			})
		end,
	},
}
