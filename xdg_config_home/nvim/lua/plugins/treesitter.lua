return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-autopairs",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = { enable = true },
            autopairs = {
                enable = true,
            },
        })
    end,
}
