"-----------------------------------------------------------------------------
" MisterMatze's Vim Configuration
"-----------------------------------------------------------------------------

" Use Vim settings rather than Vi settings
" This must be first, because it changes other options as a side effect.
set nocompatible

" Don't use Ex mode, use Q for formatting
map Q gq

" Enable mouse support in terminal emulators
if has('mouse')
  set mouse=a
endif

" Make Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Set the background to light or dark, Vim will adjust some default colors
" accordingly
set background=light

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Enable file type detection.
" Also load indent files, to automatically do language-dependent indenting
filetype plugin indent on

" Standard encoding used for new files
set encoding=utf-8

" Set the font, font weight and font size to be used in GVim
" If Vim is used in a terminal the font depends on the terminal settings
set guifont=DejaVu\ Sans\ Mono\ 10

" Set the default colorscheme
colorscheme eclipse

" Disable the arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Short commands for moving lines up and down
nnoremap _ ddkP
nnoremap - ddp

" Short command to convert the current word to uppercase in insert mode
inoremap <c-u> <esc>viwUi

" Short command to convert the current word to uppercase in normal mode
nnoremap <c-u> viwU

" Short command to temporarily disable search highlighting
noremap <space> :noh<cr>

" Short command to open the vimrc file
nnoremap <leader>ev :edit $MYVIMRC<cr>

" Short command to reload the vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" Set the size of the command history
set history=200

" Correct spelling errors
iabbrev teh the

" Enable downward searching from the current directory
set path=**

" Automatically add suffixes to filenames when searching
set suffixesadd=.js,.java,.py,.rb,.htm,.html,.css,.c,.cpp

" Disable all GUI elements (eg. the toolbar) except the file menu at the top
set guioptions=m

" Disable cursor blinking:
set guicursor+=a:blinkon0

" Enable line numbers
set number

" Enable a colorcolumn to mark the textboundary
set colorcolumn=+1

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Enable incremental searching (searching begins when you type)
set incsearch

" Disable case sensitivity for searches
set ignorecase

" Enable case sensitivity for searches that contain uppercase characters
set smartcase

" Always display a status line
set laststatus=2

" Set the default tabsize to 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Insert spaces instead of tabs
set expandtab

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable virtual editing
set virtualedit=all

" Display a file on Windows in the same way it is displayed on Unix
set viewoptions=cursor,folds,options,slash,unix

" Disable beeping
set noerrorbells

" Disable flashing on errors
set visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Disable backup files
set nobackup

" Disable swap files
set noswapfile

" Enable backup files during file writing
set writebackup

" Use the OS clipboard for all copy/paste actions
" This does not work to get text out of Vim into the X11 clipboard, therefore
" you still need to use "+y
set clipboard=unnamed

" Set the visualization characters for tabs and newlines when using list
set listchars=tab:▸\ ,eol:¬

" Force automatic linebreaks to occur only between words not inside them
set linebreak

" Set the maximum textwidth
set textwidth=78

" Enable automatic linebreaks at the textwidth border
set formatoptions+=t

"-----------------------------------------------------------------------------
" Plugin Configuration
"-----------------------------------------------------------------------------

" Matchit
runtime macros/matchit.vim

" Pathogen (Plugin installation management)
call pathogen#infect()

" Vim Latex
set grepprg=grep\ -nH\ $*

" Ensure that the filetype of empty tex files is latex instead of plaintext
let g:tex_flavor='latex'

"-----------------------------------------------------------------------------
" Filetype Configuration
"-----------------------------------------------------------------------------

" Four space indentation for Python
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4

" Don't replace tabs with spaces in Makefiles
autocmd FileType make setlocal noexpandtab

" Don't replace tabs with spaces in Go files
autocmd FileType go setlocal noexpandtab
