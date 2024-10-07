return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local actions = require("telescope.actions")

        local previewers = require("telescope.previewers")
        local Job = require("plenary.job")
        local new_maker = function(filepath, bufnr, opts)
            filepath = vim.fn.expand(filepath)
            Job:new({
                command = "file",
                args = { "--mime-type", "-b", filepath },
                on_exit = function(j)
                    local mime_type = vim.split(j:result()[1], "/")[1]
                    if mime_type == "text" then
                        previewers.buffer_previewer_maker(filepath, bufnr, opts)
                    else
                        vim.schedule(function()
                            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
                        end)
                    end
                end,
            }):sync()
        end

        require("telescope").setup({
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
            defaults = {
                -- layout_strategy = "horizontal",
                -- layout_config = {
                --     horizontal = {
                --         prompt_position = "bottom",
                --         width = { padding = 0 },
                --         height = { padding = 0 },
                --         preview_cutoff = 60,
                --     },
                -- },
                file_ignore_patterns = {
                    "node_modules",
                    ".git",
                },
                preview = {
                    filesize_limit = 0.1,
                },
                buffer_previewer_maker = new_maker,
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
            extensions = {
                wrap_results = true,
                fzf = {},
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
            },
        })

        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")
    end,
    keys = {
        {
            "<leader>/",
            function()
                require("telescope.builtin").current_buffer_fuzzy_find()
            end,
        },
        { "<leader>:", "<cmd>Telescope command_history<cr>" },
        { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>" },
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files({})
            end,
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
        },
        {
            "<leader>fh",
            function()
                require("telescope.builtin").help_tags()
            end,
        },
        {
            "<leader>gc",
            "<cmd>Telescope git_commits<cr>",
        },
        {
            "<leader>gs",
            "<cmd>Telescope git_status<cr>",
        },
    },
}
