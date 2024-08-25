Te_buf = nil
Te_win_id = nil

function ToggleRTerm()
	local gotoid = vim.fn.win_gotoid
	if gotoid(Te_win_id) == 1 then
		vim.api.nvim_command("hide")
	else
		if vim.fn.bufexists(Te_buf) ~= 1 then
			vim.api.nvim_command("65vs | te r")
			Te_win_id = vim.fn.win_getid()
			Te_buf = vim.fn.bufnr("%")
		elseif gotoid(Te_win_id) ~= 1 then
			vim.api.nvim_command("65vs | b " .. Te_buf)
			Te_win_id = vim.fn.win_getid()
		end
		vim.api.nvim_command("wincmd p")
	end
end

vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*.R",
	callback = function(args)
		vim.keymap.set("n", "<leader><leader>", ToggleRTerm, {})
		vim.keymap.set("n", "<cr>", "yy<c-w>lpi<cr><c-\\><c-n><c-w>hj", {})
		vim.keymap.set("n", "<leader><cr>", "{y}<c-w>lpi<cr><c-\\><c-n><c-w>h}j", {})
		vim.keymap.set("v", "<cr>", "y<c-w>lpi<cr><c-\\><c-n><c-w>hgv<esc>", {})
		vim.keymap.set("n", "<c-c>", "<c-w>li<c-c><c-\\><c-n><c-w>h", {})
		vim.keymap.set("n", "<c-p>", "yiw<c-w>liplot(<c-\\><c-n>pi)<cr><c-\\><c-n><c-w>h", {})
		vim.keymap.set("n", "<c-s>", "yiw<c-w>listr(<c-\\><c-n>pi)<cr><c-\\><c-n><c-w>h", {})
		vim.keymap.set("n", "<leader>p", "yiw<c-w>liprint(<c-\\><c-n>pi)<cr><c-\\><c-n><c-w>h", {})
		vim.keymap.set("n", "<leader>h>", "yiw<c-w>lihead(<c-\\><c-n>pi)<cr><c-\\><c-n><c-w>h", {})
	end,
})

return {}
