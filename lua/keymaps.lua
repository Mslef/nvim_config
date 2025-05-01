vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})

vim.keymap.set("n", "<leader>t", "<cmd>term<cr>i", {})

vim.keymap.set("t", "<esc>", "<c-\\><c-n>", {})
vim.keymap.set("t", "<C-h>", "<c-\\><c-n><C-w>h", {})
vim.keymap.set("t", "<C-l>", "<c-\\><c-n><C-w>l", {})

vim.keymap.set("n", "<leader>gg", "<cmd>te lazygit<cr><cmd>setlocal number! relativenumber!<cr>i", {})
vim.keymap.set("n", "<leader>vd", "<cmd>te vd<cr><cmd>setlocal number! relativenumber!<cr>i", {})
vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<CR>", {})
vim.keymap.set("n", "<leader>x", "<cmd>Oil<cr>", {})

vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", {})
vim.keymap.set("n", "<leader>s", "<cmd>Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics<CR>", {})

vim.keymap.set("i", "<c-b>", "`", {})

vim.keymap.set("i", "<left>", '<cmd>echo "no left! Only l!"<cr>', {})
vim.keymap.set("i", "<right>", '<cmd>echo "no right! Only h!"<cr>', {})
vim.keymap.set("i", "<up>", '<cmd>echo "no up! Only k!"<cr>', {})
vim.keymap.set("i", "<down>", '<cmd>echo "no down! Only j!"<cr>', {})
vim.keymap.set("i", "<pageup>", '<cmd>echo "no page up!"<cr>', {})
vim.keymap.set("i", "<pagedown>", '<cmd>echo "no page down!"<cr>', {})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>of", vim.diagnostic.open_float, {})
		vim.keymap.set("n", "<leader>j", vim.diagnostic.goto_prev, {})
		vim.keymap.set("n", "<leader>k", vim.diagnostic.goto_next, {})
	end,
})
