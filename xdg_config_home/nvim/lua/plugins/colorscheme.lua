return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        -- enabled = false,
        config = function()
            require("catppuccin").setup({
                integrations = {
                    native_lsp = {
                        enabled = true,
                        underlines = {
                            errors = { "undercurl" },
                            hints = { "undercurl" },
                            warnings = { "undercurl" },
                            information = { "undercurl" },
                            ok = { "undercurl" },
                        },
                    },
                },
            })
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },
}
