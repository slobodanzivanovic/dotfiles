return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priortity = 1000,
    config = function()
      require("catppuccin").setup {
        integrations = {
          cmp = true,
          gitsigns = true,
          harpoon = true,
          illuminate = true,
          indent_blankline = {
            enabled = false,
            scope_color = "sapphire",
            colored_indent_levels = false,
          },
          mason = true,
          native_lsp = { enabled = true },
          -- notify = true,
          -- nvimtree = true,
          neotree = true,
          -- symbols_outline = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
        },
      }

      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },
}
