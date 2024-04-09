vim.g.mapleader = " "

-- General keymaps
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "n", "nzz", {})
vim.keymap.set("n", "N", "Nzz", {})

vim.keymap.set("n", "<C-t>", ":vsplit<CR>", {})
vim.keymap.set("n", "<C-x>", ":bd<CR>", {})
vim.keymap.set("n", "<leader>q", ":nohlsearch<CR>", {})
vim.keymap.set("n", "<leader>b", ":ls<CR>", {})

-- Toggle DB UI
vim.keymap.set("n", "<leader>db", ":DBUIToggle<CR>", {})

-- Telescope
vim.keymap.set("n", "<C-f>", ":Telescope find_files<CR>", {})
vim.keymap.set("n", "<C-Space>", ":Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>no", ":Telescope notify<CR>", {})

-- REPL with iron
-- vim.keymap.set("n", "<leader>re", ":IronAttach<CR>", {})
-- vim.keymap.set("n", "<leader>rx", ":IronHide<CR>", {})
-- vim.keymap.set("n", "<C-e>", ":IronSend<CR>", {})

vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<cr>", {})
vim.keymap.set("n", "<leader>tx", ":LspStop<CR>", {})
vim.keymap.set("n", "<leader>h", "<cmd>lua vim.diagnostic.goto_prev()<cr>", {})
vim.keymap.set("n", "<leader>l", "<cmd>lua vim.diagnostic.goto_next()<cr>", {})

-- UI elements
return {
  {
    -- Tmux navigation
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
  },
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup({})
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      notify.setup({ background_colour = "#000000" })
      vim.notify = notify
    end,
  },
}
