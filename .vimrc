" ~john/.vimrc
"
" borrowing heavily from Steve Losh
" - http://stevelosh.com/blog/2010/09/coming-home-to-vim/#making-vim-more-useful
" - https://bitbucket.org/sjl/dotfiles/src

filetype off
call pathogen#infect("~/configs/.vim/bundle")
filetype plugin indent on
set nocompatible

" Basic options
set encoding=utf-8
set modelines=0
set autoindent
set showmode
set showcmd
set backspace=indent,eol,start
set ttyfast
set ruler
set history=50
set nolist
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=->
set laststatus=2

set incsearch
set ignorecase
set smartcase

set autowrite
set autoread

set notimeout
set ttimeout
set ttimeoutlen=10

" gui/display stuff
set t_Co=256
syntax on
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
set guioptions=egrLt  " Disable toolbar
let g:airline_powerline_fonts = 1
set mouse=a
set hlsearch

" }}}
" Trailing whitespace {{{
" Only shown when not in insert mode so I don't go insane.
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" backups and temp files
set backup
set noswapfile
set undofile

set directory=~/.vim/tmp/swp
set backupdir=~/.vim/tmp/backup
set undodir=~/.vim/tmp/undo
set backupskip=/tmp/*,/private/tmp/*

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

" tabs & spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab

" Resize splits when the window is resized
au VimResized * :wincmd =

if exists('+autochdir')
  set autochdir
else
  au BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

" }}}
" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" convenience stuff

" disable F1 help
noremap <F1> :checktime<cr>
inoremap <F1> <esc>:checktime<cr>

" normal regex
nnoremap / /\v
vnoremap / /\v

" clear search highlighting
nnoremap <leader><space> :noh<cr>

" some shortcuts
nnoremap <tab> %
vnoremap <tab> %
nnoremap ; :
inoremap jj <ESC>
