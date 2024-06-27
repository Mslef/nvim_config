vim.g.mapleader = " "

-- General keymaps
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "n", "nzz", {})
vim.keymap.set("n", "N", "Nzz", {})
vim.keymap.set("n", "N", "Nzz", {})
vim.keymap.set({ "i", "v" }, "xz", "<esc>", {})
vim.keymap.set("n", "<C-s>", ":w<CR>", {})
vim.keymap.set("n", "<C-x>", ":bd<CR>", {})

vim.keymap.set("n", "<leader>spl", ":vsplit<CR>", {})
vim.keymap.set("n", "<leader>cs", ":nohlsearch<CR>", {})
vim.keymap.set("n", "<leader>b", ":ls<CR>", {})
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})

vim.keymap.set("n", "<leader>tf", ":Telescope find_files<CR>", {})
vim.keymap.set("n", "<leader>ts", ":Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>tn", ":Telescope notify<CR>", {})
vim.keymap.set("n", "<leader>tk", ":Telescope keymaps<CR>", {})
vim.keymap.set("n", "<leader>td", ":Telescope diagnostics<CR>", {})
vim.keymap.set("n", "<leader>tb", ":Telescope buffers<CR>", {})

vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, {})
vim.keymap.set("n", "<leader>dh", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "<leader>dl", vim.diagnostic.goto_next, {})
vim.keymap.set("n", "<leader>dac", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>dx", ":LspStop<CR>", {})
vim.keymap.set("n", "<leader>d", ":LspStart<CR>", {})

vim.keymap.set("n", "<leader>z", ":PencilSoft<CR>:ZenMode<CR>", {})
vim.keymap.set("n", "<leader>db", ":DBUIToggle<CR>", {})

vim.keymap.set("n", "<leader>db", ":DBUIToggle<CR>", {})

-- Obsidian
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", {})
vim.keymap.set("n", "<leader>to", ":ObsidianSearch<CR>", {})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	end,
})
