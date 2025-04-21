vim.opt.termguicolors = true
vim.cmd("set clipboard=unnamed")
vim.cmd("set conceallevel=1 guifont=:h columns=200")
vim.cmd("set expandtab tabstop=2 softtabstop=2 shiftwidth=2")
vim.cmd("set relativenumber number")
vim.cmd("set wrap linebreak")
vim.cmd("set splitright")
vim.g.mapleader = " "

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	underline = false,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
})
require("keymaps")
