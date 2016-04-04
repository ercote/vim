
execute pathogen#infect()
syntax on
filetype plugin indent on

nohlsearch
set nowrap
set tabstop=2 " Number of visual spaces for tab
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2
autocmd FileType js setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType rb setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
set expandtab " Tabs are spaces
set noswapfile " no swap files
set showcmd
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

nmap <BS> :bprevious<CR>
nnoremap <Tab> :bnext<CR>

command! FormatJson :%!python -m json.tool
nmap <C-B> :FormatJson<CR>
nmap <C-M> :CtrlPClearAllCaches<CR>

map <C-A> <Home>
map <C-E> <End>

" CtrlP settings

" clear cache :CtrlPClearAllCaches
" CtrlP ignore these files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.gz,*.exe,*.jpg,*.png,*.gif,*.ttf,*.otf
set wildignore+=*.js.html,*/node_modules/*,*/public/assets/*,*/js_coverage/*,*/allure-results/*


let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 1 "show hidden files

" Vim airline
let g:airline#extensions#tabline#enabled = 1

" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

let g:vimroom_width=120
let g:vimroom_min_sidebar_width=5

" Open buffers with CMD+[0-9] keybindings
function! OpenOrderedBuffer(order)
  let n_buf = bufnr("$")
  if a:order > n_buf
    return
  endif
  let currbufnr = 1
  let nummatches = 1
  while currbufnr <= n_buf
    if(buflisted(currbufnr))
      if nummatches == a:order
        execute ":buffer ". currbufnr
        return
      endif
      let nummatches += 1
    endif
    let currbufnr += 1
  endwhile
endfunction
for i in [1, 2, 3, 4, 5, 6, 7, 8, 9]
  :execute "nmap <D-" . i . "> :call OpenOrderedBuffer(" . i . ")<CR>"
endfor

