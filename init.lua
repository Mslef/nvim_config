vim.opt.termguicolors = true
vim.cmd("set clipboard=unnamed")
vim.cmd("set conceallevel=1 guifont=:h columns=200")
vim.cmd("set expandtab tabstop=2 softtabstop=2 shiftwidth=2")
vim.cmd("set relativenumber number wrap linebreak splitright")
vim.g.mapleader = " "
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({ spec = { { import = "plugins" } } })
require("keymaps")
