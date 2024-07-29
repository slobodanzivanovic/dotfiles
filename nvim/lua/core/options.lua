vim.opt.guicursor =
    "n-v-c-i:block,ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append "@-@"

vim.opt.inccommand = "nosplit"
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true

vim.opt.updatetime = 50

vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.winminwidth = 5
