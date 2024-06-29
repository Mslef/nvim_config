-- vim.api.nvim_create_autocmd("Filetype *.md", {
-- 	--     vim.api.nvim_set_option_value("wrap", true, { win = 0 })
-- 	callback = function()
-- 		vim.notify("hello!", vim.log.levels.WARN)
-- 	end,
-- })

return {
	{
		"folke/zen-mode.nvim",
		dependencies = { "folke/twilight.nvim" },
		opts = {
			window = {
				width = 0.8,
				options = {
					number = false,
					relativenumber = false,
				},
			},
			plugins = {
				tmux = { enabled = true },
			},
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
				mappings = {
					["<cr>"] = {
						action = function()
							return require("obsidian").util.smart_action()
						end,
						opts = { buffer = true, expr = true },
					},
				},
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
