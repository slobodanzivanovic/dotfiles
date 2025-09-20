set nocompatible
syntax enable

set timeoutlen=1000
set ttimeoutlen=10
set ttyfast

set mouse=a

set number
set relativenumber
set ruler
set showcmd
set laststatus=2
set wildmenu
set wildmode=longest:full,full

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set noexpandtab
set smarttab

set backspace=indent,eol,start
set nowrap

set autoread
set encoding=utf-8
set fileencoding=utf-8

set lazyredraw

set cindent
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqrn1

set scrolloff=10

filetype plugin indent on

autocmd FileType c,cpp,java,javascript,typescript setlocal cindent
autocmd FileType python setlocal autoindent smartindent
autocmd FileType html,xml,css setlocal autoindent
autocmd FileType json setlocal autoindent

if &term =~ "screen"
	set t_Co=256
endif

set t_Co=256

let mapleader = " "

function! FzfFiles()
	let l:temp = tempname()
	execute 'silent !fzf > ' . l:temp
	if !v:shell_error
		let l:file = readfile(l:temp)[0]
		if !empty(l:file)
			execute 'edit ' . fnameescape(l:file)
		endif
	endif
	call delete(l:temp)
	redraw!
endfunction

nnoremap <silent> <leader>f :call FzfFiles()<CR>

nnoremap <silent> <Esc> :nohlsearch<CR>

nnoremap <C-a> ggVG

nnoremap Y y$

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+y$
nnoremap <leader>yy "+yy

nnoremap <leader>ya ggVG"+y<C-o><C-o>

vnoremap < <gv
vnoremap > >gv
