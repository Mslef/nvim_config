vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*.R",
	callback = function(args)
		vim.keymap.set("n", "<leader><leader>", "<cmd>65vs<CR><cmd>term r<cr><c-\\><c-n><c-w>h", {})
		-- vim.keymap.set("n", "<leader>sp", "65<cmd>vt<CR><cmd>term python<cr><cr><c-\\><c-n><c-w>h", {})
		vim.keymap.set("n", "<cr>", "yy<c-w>lpi<cr><c-\\><c-n><c-w>hj", {})
		vim.keymap.set("n", "<leader><cr>", "{y}<c-w>lpi<cr><c-\\><c-n><c-w>h}j", {})
		vim.keymap.set("v", "<cr>", "y<c-w>lpi<cr><c-\\><c-n><c-w>hgv<esc>", {})
		vim.keymap.set("n", "<c-c>", "<c-w>li<c-c><c-\\><c-n><c-w>h", {})
		vim.keymap.set("n", "<c-p>", "yiw<c-w>liplot(<c-\\><c-n>pi)<cr><c-\\><c-n><c-w>h", {})
		vim.keymap.set("n", "<c-s>", "yiw<c-w>listr(<c-\\><c-n>pi)<cr><c-\\><c-n><c-w>h", {})
		vim.keymap.set("n", "<leader>p", "yiw<c-w>liprint(<c-\\><c-n>pi)<cr><c-\\><c-n><c-w>h", {})
		vim.keymap.set("n", "<c-h>", "yiw<c-w>lihead(<c-\\><c-n>pi)<cr><c-\\><c-n><c-w>h", {})
	end,
})

return {}
