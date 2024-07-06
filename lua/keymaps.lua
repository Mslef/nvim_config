
vim.keymap.set("n", "<leader>tk", ":Telescope keymaps<CR>", {})

vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "n", "nzz", {})
vim.keymap.set("n", "N", "Nzz", {})
vim.keymap.set("n", "N", "Nzz", {})
vim.keymap.set("n", "k", "gk", {})
vim.keymap.set("n", "j", "gj", {})
vim.keymap.set({ "i", "v" }, "<c-space>", "<esc>", {})
vim.keymap.set("n", "<leader>wd", ":w<CR>", {})
vim.keymap.set("n", "<leader>qq", ":bp|bd #<CR>", {})
vim.keymap.set("n", "<leader>ex", ":Oil<cr>", {})

vim.keymap.set("n", "<leader>spl", ":vsplit<CR>", {})
vim.keymap.set("n", "<leader>cs", ":nohlsearch<CR>", {})
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})

vim.keymap.set("n", "<leader>tf", ":Telescope find_files<CR>", {})
vim.keymap.set("n", "<leader>ts", ":Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>tn", ":Telescope notify<CR>", {})

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

local builtin = require("telescope.builtin")
local action_state = require("telescope.actions.state")

vim.keymap.set("n", "<leader>bb", function()
	builtin.buffers({
		initial_mode = "normal",
		attach_mappings = function(prompt_bufnr, map)
			local delete_buf = function()
				local current_picker = action_state.get_current_picker(prompt_bufnr)
				current_picker:delete_selection(function(selection)
					vim.api.nvim_buf_delete(selection.bufnr, { force = true })
				end)
			end

			map("n", "<c-d>", delete_buf)

			return true
		end,
	}, {
		sort_lastused = true,
		sort_mru = true,
		theme = "dropdown",
	})
end)
