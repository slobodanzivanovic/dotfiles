local set = vim.opt_local
local map = vim.keymap.set

local function augroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

vim.api.nvim_create_autocmd("TermOpen", {
    group = augroup("custom-term-open"),
    callback = function()
        set.number = false
        set.relativenumber = false
        set.scrolloff = 0

        vim.bo.filetype = "terminal"
    end,
})

map("t", "<esc><esc>", "<c-\\><c-n>")
map("n", "<leader>te", ":split | te<CR>i", { silent = true })

map("n", ",st", function()
    vim.cmd.new()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 10)
    vim.wo.winfixheight = true
    vim.cmd.term()
end)
