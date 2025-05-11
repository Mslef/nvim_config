-- Buffers
vim.keymap.set("n", "<leader>b", function()
	require("telescope.builtin").buffers({
		initial_mode = "normal",
		attach_mappings = function(prompt_bufnr, map)
			local delete_buf = function()
				local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
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

-- -- Zotero citations
-- vim.keymap.set("n", "<leader>z", function()
--   require("telescope").extensions.bibtex.bibtex({
--     attach_mappings = function(prompt_bufnr, map)
--       local insert_cit = require("telescope.actions.state").get_current_picker(prompt_bufnr)
--       map("i", "<c-c>", insert_cit)
--       return true
--     end,
--   })
-- end)

return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-telescope/telescope-bibtex.nvim", "nvim-lua/plenary.nvim" },
	lazy = false,
	opts = {
		extensions = {
			bibtex = {
				custom_formats = {},
				format = "",
				global_files = { "~/Documents/Zotero/Library.bib" },
				citation_format = "{{author}} ({{year}})",
				citation_trim_firstname = true,
				citation_max_auth = 2,
				context = false,
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("bibtex")
	end,
}
