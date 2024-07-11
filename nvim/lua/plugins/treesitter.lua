return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-autopairs",
  },
  config = function()
    require("nvim-treesitter.configs").setup {
      auto_install = true,
      sync_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true },
      autopairs = {
        enable = true,
      },
      ensure_installed = {
        "html",
        "xml",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "java",
        "jsdoc",
        "json",
        "jsonc",
        "php",
        "python",
        "lua",
        "markdown",
        "sql",
      },
    }
  end,
}
