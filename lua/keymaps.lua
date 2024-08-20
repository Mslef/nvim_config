vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "n", "nzz", {})
vim.keymap.set("n", "N", "Nzz", {})
vim.keymap.set("n", "N", "Nzz", {})
vim.keymap.set("n", "k", "gk", {})
vim.keymap.set("n", "j", "gj", {})
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})

vim.keymap.set("n", "<leader>co", ":e ~/.config/nvim/.<cr>", {})
vim.keymap.set("n", "<leader>t", ":term<cr>i", {})
vim.keymap.set("t", "<Esc>", "<c-\\><c-n>", {})
vim.keymap.set("n", "<leader>of", vim.diagnostic.open_float, {})
vim.keymap.set("n", "<leader>j", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "<leader>k", vim.diagnostic.goto_next, {})
vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, {})

vim.keymap.set("n", "<leader>db", ":DBUIToggle<CR>", {})
vim.keymap.set("n", "<leader>x", ":Oil<cr>", {})

-- À éliminer
vim.keymap.set("n", "<leader>cs", ":noh<CR>", {})
vim.keymap.set("n", "<leader>qq", ":bp|bd #<CR>", {})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	end,
})
