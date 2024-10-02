vim.opt.shortmess:append("sI")
vim.opt.errorbells = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.cursorline = true
vim.opt.ruler = false
vim.opt.showmode = false
vim.opt.showmatch = true
vim.opt.matchtime = 3
vim.opt.backspace = "indent,eol,start"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.wrap = false
vim.opt.textwidth = 120

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 999
vim.opt.isfname:append("@-@")

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.formatoptions:append("cro")

vim.opt.timeoutlen = 400
vim.opt.updatetime = 100
vim.opt.confirm = true

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
