Builtin = require("telescope.builtin")
Action_state = require("telescope.actions.state")

vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", {})
vim.keymap.set("n", "<leader>s", "<cmd>Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>m", "<cmd>Telescope notify<CR>", {})
vim.keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", {})

-- Buffers
vim.keymap.set("n", "<leader>b", function()
	Builtin.buffers({
		initial_mode = "normal",
		attach_mappings = function(prompt_bufnr, map)
			local delete_buf = function()
				local current_picker = Action_state.get_current_picker(prompt_bufnr)
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

-- Zotero citations
vim.keymap.set("n", "<leader>z", function()
	require("telescope").extensions.bibtex.bibtex({
		attach_mappings = function(prompt_bufnr, map)
			local insert_cit = Action_state.get_current_picker(prompt_bufnr)
			map("i", "<c-c>", insert_cit)
			return true
		end,
	})
end)

return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-telescope/telescope-bibtex.nvim" },
	opts = {
		extensions = {
			bibtex = {
				-- Custom format for citation label
				custom_formats = {},
				-- Format to use for citation label.
				-- Try to match the filetype by default, or use 'plain'
				format = "",
				-- Path to global bibliographies (placed outside of the project)
				global_files = { "~/Documents/Zotero/Library.bib" },
				-- Template for the formatted citation
				citation_format = "{{author}} ({{year}})",
				-- Only use initials for the authors first name
				citation_trim_firstname = true,
				-- Max number of authors to write in the formatted citation
				-- following authors will be replaced by "et al."
				citation_max_auth = 2,
				-- Context awareness disabled by default
				context = false,
				-- Wrapping in the preview window is disabled by default
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("bibtex")
	end,
}
