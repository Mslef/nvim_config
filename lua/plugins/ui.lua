vim.g.mapleader = " "
vim.cmd("set clipboard=unnamed")
vim.cmd("set conceallevel=1")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set guifont=:h")
vim.opt.termguicolors = true

-- General keymaps
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "n", "nzz", {})
vim.keymap.set("n", "N", "Nzz", {})
vim.keymap.set("n", "N", "Nzz", {})
vim.keymap.set("i", "ùù", "<esc>", {})
vim.keymap.set("n", "<C-s>", ":w<CR>", {})
vim.keymap.set("n", "<C-x>", ":bd<CR>", {})

vim.keymap.set("n", "<leader>spl", ":vsplit<CR>", {})
vim.keymap.set("n", "<leader>s", ":nohlsearch<CR>", {})
vim.keymap.set("n", "<leader>b", ":ls<CR>", {})

-- Telescope
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

-- Toggle UI modes
vim.keymap.set("n", "<leader>z", ":Pencil<CR>:ZenMode<CR>", {})
vim.keymap.set("n", "<leader>db", ":DBUIToggle<CR>", {})

-- Obsidian
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", {})
vim.keymap.set("n", "<leader>to", ":ObsidianSearch<CR>", {})

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({ flavor = "frappe" })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "ryanoasis/vim-devicons" },
    config = function()
      require("lualine").setup({
        theme = "nightfly",
        sections = {
          lualine_a = { "" },
          lualine_b = { "" },
          lualine_c = { "" },
          lualine_x = { "filename", "filetype" },
          lualine_y = { "branch", "diff", "searchcount" },
        },
      })
    end,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { "tpope/vim-dadbod", "kristijanhusak/vim-dadbod-completion" },
  },
  {
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
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    event = "VeryLazy",
    config = function()
      require("notify").setup({ background_colour = "#000000" })
      require("noice").setup({
        cmdline = {
          opts = {
            relative = "editor",
            position = "5%",
          },
        },
        lsp = {
          progress = {
            enabled = false,
          },
        },
      })
    end,
  },
}
