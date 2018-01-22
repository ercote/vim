set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'ervandew/supertab'
Plugin 'mileszs/ack.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'elzr/vim-json'
Plugin 'itchyny/lightline.vim'
Plugin 'moll/vim-node'
Plugin 'jiangmiao/auto-pairs'
call vundle#end()

syntax on
filetype plugin indent on

nohlsearch
set nowrap
set tabstop=2 " Number of visual spaces for tab
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2

autocmd FileType js setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd FileType rb setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

set expandtab " Tabs are spaces
set noswapfile " no swap files
set showcmd
set wildmenu
set showmatch " show matching brackets
set number " Show line numbers
set laststatus=2
set incsearch " search as characters are entered
set ignorecase


if !has('gui_running')
  set background=dark
  colorscheme solarized
endif

" moving easily between windows
map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-k> <C-W>k
map <C-l> <C-W>l

" autocmd
autocmd BufWritePre * :%s/\s\+$//e

"Faster shortcut for commenting. Requires T-Comment plugin
map <leader>c <c-_><c-_>

command! FormatJson :%!python -m json.tool

command! Dark :set background=dark
command! Light :set background=light
Dark

map <C-A> <Home>
map <C-E> <End>
nmap <C-M> :CtrlPClearAllCaches<CR>

nnoremap B ^
nnoremap E $

" CtrlP settings

" clear cache :CtrlPClearAllCaches
" CtrlP ignore these files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.gz,*.exe,*.jpg,*.png,*.gif,*.ttf,*.otf
set wildignore+=*.js.html,*/node_modules/*,*/public/assets/*,*/js_coverage/*,*/allure-results/*

let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'bottom,order:ttb'

" ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" open Ack
nnoremap <C-a> :Ack '' <Left><Left>

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

