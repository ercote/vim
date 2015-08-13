" Configuration

execute pathogen#infect()
syntax on
filetype plugin indent on

nohlsearch

set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
" no swap files
set noswapfile

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

"Faster shortcut for commenting. Requires T-Comment plugin
map <leader>c <c-_><c-_>

set showmatch " show matching brackets

" Hide line numbers
:set nonumber

" CtrlP ignore these files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.gz,*.exe,*.jpg,*.png,*.gif,*.ttf,*.otf
set wildignore+=*.js.html,*/node_modules/*,*/public/assets/* " Rails/Compiled assets/JS Coverage/Karma/etc.

" Vim airline
let g:airline#extensions#tabline#enabled = 1

" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

set laststatus=2

nmap <C-Tab> :bnext<CR>
nmap <S-C-Tab> :bprevious<CR>
nmap <BS> :bprevious<CR>
nnoremap <Tab> :bnext<CR>


let g:vimroom_width=120
let g:vimroom_min_sidebar_width=5
