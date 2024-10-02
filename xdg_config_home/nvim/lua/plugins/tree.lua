return {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            popup_border_style = "rounded",
            source_selector = {
                -- winbar = true,
                statusline = false,
            },
            close_if_last_window = true,
            sources = { "filesystem", "buffers", "git_status", "document_symbols" },
            open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
            window = {
                position = "left",
            },
            filesystem = {
                bind_to_cwd = false,
                group_empty_dirs = true,
                scan_mode = "deep",
                follow_current_file = { enabled = true },
                use_libuv_file_watcher = true,
            },
            default_component_configs = {
                indent = {
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
            },
        })
    end,
    keys = {
        { "<leader>ee", "<cmd>Neotree toggle right<CR>" },
        { "<leader>bf", "<cmd>Neotree buffers reveal float<CR>" },
        { "<leader>ef", "<cmd>Neotree focus<CR>" },
    },
}
