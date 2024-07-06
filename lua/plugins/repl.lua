vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*.R, *.py",
	callback = function(args)
		vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})
		vim.keymap.set("n", "<leader>trm", ":70vs<CR>:term<CR>", {})
		vim.keymap.set("n", "<leader>sr", ":65vs<CR>:term r<cr><c-\\><c-n><c-w>h", {})
		vim.keymap.set("n", "<leader>sp", "65:vt<CR>:term python<cr><cr><c-\\><c-n><c-w>h", {})
		vim.keymap.set("n", "<leader>ll", "yy<c-w>lpi<cr><c-\\><c-n><c-w>h", {})
		vim.keymap.set("n", "<leader><cr>", "{y}<c-w>lpi<cr><c-\\><c-n><c-w>h}j", {})
		vim.keymap.set("v", "<cr>", "y<c-w>lpi<cr><c-\\><c-n><c-w>hgv<esc>", {})
	end,
})

return {}
