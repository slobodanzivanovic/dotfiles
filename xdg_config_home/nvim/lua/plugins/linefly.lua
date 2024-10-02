return {
    "bluz71/nvim-linefly",
    config = function()
        vim.g.linefly_options = {
            progress_symbol = "",
            error_symbol = " ",
            warning_symbol = " ",
            information_symbol = " ",
            hint_symbol = " ",
            with_session_status = true,
            with_attached_clients = false,
            with_search_count = true,
            with_indent_status = true,
        }
    end,
}
