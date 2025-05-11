local Te_buf = nil
local Te_win_id = nil

function ToggleTerm(cmd, switchWindow)
	cmd = cmd or ""
	switchWindow = switchWindow or false
	local gotoid = vim.fn.win_gotoid
	if Te_win_id and gotoid(Te_win_id) == 1 then
		vim.cmd("hide")
		return
	end

	if not Te_buf or vim.fn.bufexists(Te_buf) ~= 1 or vim.fn.buflisted(Te_buf) ~= 1 then
		vim.cmd("65vs|te " .. cmd)
		Te_win_id = vim.fn.win_getid()
		Te_buf = vim.fn.bufnr("%")
	else
		vim.cmd("65vs | b " .. Te_buf)
		Te_win_id = vim.fn.win_getid()
	end

	if switchWindow then
		vim.cmd("wincmd p")
	else
		vim.cmd("startinsert")
	end
end

vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*.R,*.Rmd,*.rmd",
	callback = function(args)
		vim.keymap.set("n", "<leader><leader>", function()
			ToggleTerm("r", true)
			vim.keymap.set("n", "<cr>", "yy<c-w>wpi<cr><c-\\><c-n><c-w>wj", {})
			vim.keymap.set("v", "<cr>", "y<c-w>wpi<cr><c-\\><c-n><c-w>wgv<esc>", {})
			vim.keymap.set("n", "<c-c>", "<c-w>wi<c-c><c-\\><c-n><c-w>w", {})
		end, {})
	end,
})

vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*.py",
	callback = function(args)
		vim.keymap.set("n", "<leader><leader>", function()
			ToggleTerm("python3", true)
			vim.keymap.set("n", "<cr>", "yy<c-w>wpi<cr><c-\\><c-n><c-w>wj", {})
			vim.keymap.set("v", "<cr>", "y<c-w>wpi<cr><c-\\><c-n><c-w>wgv<esc>", {})
			vim.keymap.set("n", "<c-c>", "<c-w>wi<c-c><c-\\><c-n><c-w>w", {})
		end, {})
	end,
})

vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*.go,*.templ",
	callback = function(args)
		vim.keymap.set("n", "<leader><leader>", ToggleTerm, {})
	end,
})

vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*.Rmd,*.rmd",
	callback = function(args)
		vim.keymap.set("i", "<c-c>", "```{r}<cr><cr>```", {})
		vim.keymap.set(
			"n",
			"<leader>r",
			'<cmd>let @+ = expand("%:p")<cr><c-w>lirmarkdown::render(input="<c-\\><c-n>pi")<cr><c-\\><c-n><c-w>h',
			{}
		)
	end,
})

return {}
