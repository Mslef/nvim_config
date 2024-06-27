vim.cmd("set clipboard=unnamed")
vim.cmd("set conceallevel=1")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set guifont=:h")
vim.cmd("set columns=200")
vim.cmd("let g:python3_host_prog='/Users/marcellefebvre/.pyenv/shims/python3'")
vim.cmd("let g:python_host_prog='/Users/marcellefebvre/.pyenv/shims/python'")
vim.opt.termguicolors = true

-- bootstrap lazy.nvim, LazyVim and your plugins
--require("config.lazy")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
require("keymaps")

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
