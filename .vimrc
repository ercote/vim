execute pathogen#infect()
syntax on
filetype plugin indent on

set encoding=utf-8

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
set number " DO NOT show line numbers
set laststatus=2
set incsearch " search as characters are entered

nnoremap <space> :nohlsearch<CR>

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" moving easily between windows
map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-k> <C-W>k
map <C-l> <C-W>l

" autocmd
autocmd BufWritePre * :%s/\s\+$//e
augroup configgroup
    autocmd!
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.js setlocal tabstop=4
    autocmd BufEnter *.js setlocal shiftwidth=4
    autocmd BufEnter *.js setlocal softtabstop=4
augroup END

nmap <BS> :bprevious<CR>
nnoremap <Tab> :bnext<CR>

function! ToggleBackground()
    if (&background == "light")
        set background=dark
    else
        set background=light
    endif
endfunction
command! ToggleBG :call ToggleBackground()

command! FormatJson :%!python -m json.tool
nmap <C-M> :CtrlPClearAllCaches<CR>

map <C-A> <Home>
map <C-E> <End>
nnoremap B ^
nnoremap E $

" CtrlP settings

" clear cache :CtrlPClearAllCaches
" CtrlP ignore these files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.gz,*.exe,*.jpg,*.png,*.gif,*.ttf,*.otf
set wildignore+=*.js.html,*/node_modules/*,*/public/assets/*,*/js_coverage/*,*/allure-results/*

let g:one_allow_italics = 1

let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" --ignore node_modules --ignore .git --ignore "*.js.html" --ignore public/assets --ignore js_coverage --ignore allure-results -- ignore logs'

" ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" open ag.vim
nnoremap <C-a> :Ag '

" Vim airline
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='one'
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'
let g:Powerline_symbols = 'fancy'

let g:vimroom_width=120
let g:vimroom_min_sidebar_width=5

" Open buffers with CMD+[1-9] keybindings
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

