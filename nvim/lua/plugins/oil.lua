return {
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup {
                columns = { "icon" },
                view_options = {
                    show_hidden = true,
                },
                delete_to_trash = true,
            }

            vim.keymap.set("n", "-", "<cmd>Oil<CR>")
            vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
        end,
    },
}
