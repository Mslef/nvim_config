Notes_subdir = "/Users/marcellefebvre/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/"

CreateNote = function()
	vim.cmd("e " .. Notes_subdir .. os.date("%d%m%Y%H%M") .. ".md")
end

SearchNotes = function()
	vim.cmd("lcd " .. Notes_subdir .. " | Telescope live_grep")
end

vim.api.nvim_create_user_command("CreateNote", CreateNote, {})
vim.api.nvim_create_user_command("SearchNotes", SearchNotes, {})
vim.keymap.set("n", "<leader>n", ":CreateNote<cr>", {})
vim.keymap.set("n", "<leader>sn", ":SearchNotes<cr>", {})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.md",
	callback = function(args)
		require("cmp").setup.buffer({ sources = {} })
		vim.cmd("setlocal norelativenumber nonumber")
		vim.cmd("setlocal foldcolumn=9")
		vim.cmd("setlocal columns=150")
	end,
})

return {}
