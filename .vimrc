
execute pathogen#infect()
syntax on
filetype plugin indent on

nohlsearch
set nowrap
set tabstop=2 " Number of visual spaces for tab
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2
set expandtab " Tabs are spaces
set noswapfile " no swap files
set showcmd
"set cursorline
set wildmenu
set showmatch " show matching brackets
set number " Show line numbers
set laststatus=2 "display the status line always
set incsearch

if !has('gui_running')
  let g:solarized_termtrans=1
  let g:solarized_termcolors=256
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

nmap <C-Tab> :bnext<CR>
nmap <S-C-Tab> :bprevious<CR>
nmap <BS> :bprevious<CR>
nnoremap <Tab> :bnext<CR>


" CtrlP settings

" clear cache :CtrlPClearAllCaches
" CtrlP ignore these files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.gz,*.exe,*.jpg,*.png,*.gif,*.ttf,*.otf
set wildignore+=*.js.html,*/node_modules/*,*/public/assets/*,*/js_coverage/*
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 1 "show hidden files

" Vim airline
let g:airline#extensions#tabline#enabled = 1

" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

let g:vimroom_width=120
let g:vimroom_min_sidebar_width=5

