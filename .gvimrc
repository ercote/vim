let hour = strftime("%H")
if hour >= 6 && hour < 15
  set background=light
else
  set background=dark
endif
colorscheme one

set guifont=Fira\ Mono:h12
set linespace=8
" subpixel antialias: defaults write org.vim.MacVim AppleFontSmoothing int 0

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

