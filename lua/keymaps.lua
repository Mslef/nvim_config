vim.opt.termguicolors = true
vim.cmd("set clipboard=unnamed")
vim.cmd("set conceallevel=1 guifont=:h columns=200")
vim.cmd("set expandtab tabstop=2 softtabstop=2 shiftwidth=2")
vim.cmd("set relativenumber number")
vim.cmd("set wrap linebreak")
vim.cmd("set splitright")
vim.cmd("let g:python3_host_prog='/Users/marcellefebvre/.pyenv/shims/python3'")
vim.cmd("let g:python_host_prog='/Users/marcellefebvre/.pyenv/shims/python'")
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>tk", ":Telescope keymaps<CR>", {})

vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "n", "nzz", {})
vim.keymap.set("n", "N", "Nzz", {})
vim.keymap.set("n", "N", "Nzz", {})
vim.keymap.set("n", "k", "gk", {})
vim.keymap.set("n", "j", "gj", {})
vim.keymap.set({ "i", "v" }, "xz", "<esc>", {})
vim.keymap.set("n", "<leader>s", ":w<CR>", {})
vim.keymap.set("n", "<C-x>", ":bd<CR>", {})

vim.keymap.set("n", "<leader>spl", ":vsplit<CR>", {})
vim.keymap.set("n", "<leader>cs", ":nohlsearch<CR>", {})
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<leader>tb", ":Telescope buffers<CR>", {})
vim.keymap.set("n", "<leader>b", ":ls<CR>", {})

vim.keymap.set("n", "<leader>tf", ":Telescope find_files<CR>", {})
vim.keymap.set("n", "<leader>ts", ":Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>tn", ":Telescope notify<CR>", {})

-- REPL
vim.keymap.set("n", "<leader>trm", ":vsplit<CR>:terminal<CR>", {})
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})
vim.keymap.set("n", "<leader>sr", ":vsplit<CR>:vertical resize 70<CR>:terminal<CR>ir<cr><c-\\><c-n><c-w>h", {})
vim.keymap.set("n", "<leader>sp", ":vsplit<CR>:vertical resize 70<CR>:terminal<CR>ipython<cr><c-\\><c-n><c-w>h", {})
vim.keymap.set("v", "<leader>rv", "y<c-w>lpi<cr><c-\\><c-n><c-w>hgvV", {})
vim.keymap.set("n", "<leader>rl", "yy<c-w>lpi<cr><c-\\><c-n><c-w>h", {})
vim.keymap.set("n", "<leader>rp", "{y}<c-w>lpi<cr><c-\\><c-n><c-w>h}", {})

-- Diagnostics
vim.keymap.set("n", "<leader>td", ":Telescope diagnostics<CR>", {})
vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, {})
vim.keymap.set("n", "<leader>dh", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "<leader>dl", vim.diagnostic.goto_next, {})
vim.keymap.set("n", "<leader>dac", vim.lsp.buf.code_action, {})

-- Obsidian
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", {})
vim.keymap.set("n", "<leader>to", ":ObsidianSearch<CR>", {})
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", {})

vim.keymap.set("n", "<leader>db", ":DBUIToggle<CR>", {})

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
