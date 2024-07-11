return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priortity = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },
}
