return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priortity = 1000,
    config = function()
      require("catppuccin").setup {
        transparent_background = true,
      }
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },
}
