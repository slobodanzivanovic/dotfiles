vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

local opt = vim.opt

vim.cmd.colorscheme("hybrid")

opt.guicursor = ""
opt.shortmess:append("sI")
opt.errorbells = false
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.cursorline = true
opt.showmatch = true
opt.matchtime = 3
opt.backspace = "indent,eol,start"
opt.pumblend = 10
opt.pumheight = 10
opt.winminwidth = 5
opt.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
}
opt.conceallevel = 2
opt.smoothscroll = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
-- vim.opt.textwidth = 120
opt.autowrite = true
opt.undofile = true
opt.undolevels = 10000
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.inccommand = "nosplit"
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.completeopt = "menu,menuone,noselect"
opt.timeoutlen = 400
opt.updatetime = 200
opt.confirm = true
opt.wildmode = "longest:full,full"
opt.virtualedit = "block"
opt.jumpoptions = "view"
opt.laststatus = 3
opt.linebreak = true
opt.list = true
opt.mouse = "a"
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false
opt.spelllang = { "en" }
opt.spelloptions:append("noplainbuffer")
opt.termguicolors = true

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
