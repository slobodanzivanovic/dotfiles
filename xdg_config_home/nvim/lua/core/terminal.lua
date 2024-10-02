local set = vim.opt_local

vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", {}),
    callback = function()
        set.number = false
        set.relativenumber = false
        set.scrolloff = 0

        vim.bo.filetype = "terminal"
    end,
})

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<leader>te", ":split | te<CR>i", { silent = true })

vim.keymap.set("n", ",st", function()
    vim.cmd.new()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 10)
    vim.wo.winfixheight = true
    vim.cmd.term()
end)
