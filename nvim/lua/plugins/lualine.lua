return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local harpoon = require "harpoon.mark"

        local function truncate_branch_name(branch)
            if not branch or branch == "" then
                return ""
            end

            local _, _, ticket_number = string.find(branch, "skdillon/sko%-(%d+)%-")

            if ticket_number then
                return "sko-" .. ticket_number
            else
                return branch
            end
        end

        local function harpoon_component()
            local total_marks = harpoon.get_length()

            if total_marks == 0 then
                return ""
            end

            local current_mark = "—"

            local mark_idx = harpoon.get_current_index()
            if mark_idx ~= nil then
                current_mark = tostring(mark_idx)
            end

            return string.format("󱡅 %s/%d", current_mark, total_marks)
        end

        require("lualine").setup {
            options = {
                theme = "auto",
                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard", "alpha" } },
            },
            sections = {
                lualine_b = {
                    { "branch", icon = "", fmt = truncate_branch_name },
                    harpoon_component,
                    {
                        "diff",
                        symbols = {
                            added = " ",
                            modified = " ",
                            removed = " ",
                        },
                        source = function()
                            local gitsigns = vim.b.gitsigns_status_dict
                            if gitsigns then
                                return {
                                    added = gitsigns.added,
                                    modified = gitsigns.changed,
                                    removed = gitsigns.removed,
                                }
                            end
                        end,
                    },
                    {
                        "diagnostics",
                        symbols = {
                            error = " ",
                            warn = " ",
                            hint = " ",
                            info = " ",
                        },
                    },
                },
                lualine_c = {
                    { "filename", path = 1, file_status = true },
                    -- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                },
                lualine_x = {},
                lualine_y = {
                    { "progress", separator = " ", padding = { left = 1, right = 0 } },
                    { "location", padding = { left = 0, right = 1 } },
                },
                lualine_z = {
                    function()
                        return " " .. os.date "%R"
                    end,
                },
            },
            extensions = { "neo-tree", "lazy" },
        }
    end,
}
