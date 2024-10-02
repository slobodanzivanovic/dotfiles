return {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { enabled = false },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "dbui",
                },
            },
        },
        main = "ibl",
    },
    -- {
    --     "echasnovski/mini.indentscope",
    --     version = false,
    --     event = { "BufReadPre", "BufNewFile" },
    --     opts = {
    --         symbol = "│",
    --         options = { try_as_border = true },
    --     },
    --     init = function()
    --         vim.api.nvim_create_autocmd("FileType", {
    --             pattern = {
    --                 "help",
    --                 "alpha",
    --                 "dashboard",
    --                 "neo-tree",
    --                 "Trouble",
    --                 "trouble",
    --                 "lazy",
    --                 "mason",
    --                 "dbui",
    --             },
    --             callback = function()
    --                 vim.b.miniindentscope_disable = true
    --             end,
    --         })
    --     end,
    -- },
}
