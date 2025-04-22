vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "n", "nzz", {})
vim.keymap.set("n", "N", "Nzz", {})
vim.keymap.set("n", "k", "gk", {})
vim.keymap.set("n", "j", "gj", {})
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})

vim.keymap.set("n", "<leader>t", "<cmd>term<cr>i", {})
vim.keymap.set("t", "<c-x>", "<c-\\><c-n>", {})

vim.keymap.set("n", "<leader>x", "<cmd>Oil<cr>", {})
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", {})
vim.keymap.set("n", "<leader>s", "<cmd>Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>m", "<cmd>Telescope notify<CR>", {})
vim.keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", {})
vim.keymap.set("n", "<leader>ct", "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<CR>", {})


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
