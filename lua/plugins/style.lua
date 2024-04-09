-- Colorscheme and general appearance of Neovim
--
-- Tabs and line numbers
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set guifont=:h")

return {

  {
    -- Catppuccin colorschcheme with transparency
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        flavor = "frappe",
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    -- Dev icons
    "ryanoasis/vim-devicons",
  },
  {
    {
      -- Status line at the bottom of the screen
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("lualine").setup({
          theme = "nightfly",
          sections = {
            lualine_a = {
              {
                "mode",
                fmt = function(res)
                  return res:sub(1, 1)
                end,
              },
            },
            lualine_b = { "filename" },
            lualine_c = { "searchcount" },
            lualine_x = { "filetype" },
            lualine_y = { "branch", "diff", "diagnostics" },
          },
        })
      end,
    },
  },
}
