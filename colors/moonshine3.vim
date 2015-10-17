" Moonshine
let colors_name = "moonshine3"

" Colors used
let s:vmode = "gui"

" let s:background = "#171738"
let s:background = "#191d32"
let s:foreground = "#96acb7"
let s:string = "#6d3b47"
let s:string = "#748f70"
let s:comment = "#2f4b54"

let s:definition = "#8681c6"
let s:constant = s:definition 
let s:vars = "#09bc8a"
let s:selection = "#1b065e"
let s:operators = "#cdc6a5"
let s:line = "#1b065e"
let s:window = "#1b065e"
let s:status_line = "#0f110c" 

let s:cursor_line = s:operators
let s:type = s:constant
let s:keyword = s:constant
let s:todo = s:comment
let s:underlined = s:foreground

let g:moonshine_termcolors=1
let g:moonshine_bold=1
let g:moonshine_underline=1
let g:moonshine_italic=1

hi clear
if exists("syntax_on")
  syntax reset
endif


if g:moonshine_termcolors == 256
  let s:vmode       = "cterm"
  let s:background      = "234"
  let s:status_line      = "235"
  let s:comment      = "239"
  let s:status_line      = "240"
  let s:foreground       = "244"
  let s:cursor_line       = "245"
  let s:status_line       = "187"
  let s:type      = "136"
  let s:vars      = "166"
  let s:foreground         = "124"
  let s:todo     = "125"
  let s:underlined      = "61"
  let s:definition        = "33"
  let s:string        = "37"
  let s:keyword       = "64"
endif

let s:none            = "NONE"
let s:none            = "NONE"
let s:t_none          = "NONE"
let s:n               = "NONE"
let s:c               = ",undercurl"
let s:r               = ",reverse"
let s:s               = ",standout"
let s:ou              = ""
let s:ob              = ""

if (has("gui_running"))
  let s:back        = s:background
else
  let s:back        = "NONE"
endif

if g:moonshine_bold == 1
  let s:b           = ",bold"
else
  let s:b           = ""
endif

if g:moonshine_underline == 1
  let s:u           = ",underline"
else
  let s:u           = ""
endif

if g:moonshine_italic == 1
  let s:i           = ",italic"
else
  let s:i           = ""
endif

exe "let s:bg_none      = ' ".s:vmode."bg=".s:none   ."'"
exe "let s:bg_back      = ' ".s:vmode."bg=".s:back   ."'"
exe "let s:bg_base2    = ' ".s:vmode."bg=".s:status_line ."'"
exe "let s:bg_base01    = ' ".s:vmode."bg=".s:comment ."'"
exe "let s:bg_base00    = ' ".s:vmode."bg=".s:status_line ."'"
exe "let s:bg_base0     = ' ".s:vmode."bg=".s:foreground  ."'"
exe "let s:bg_base1     = ' ".s:vmode."bg=".s:cursor_line  ."'"
exe "let s:bg_base2     = ' ".s:vmode."bg=".s:status_line  ."'"
exe "let s:bg_base3     = ' ".s:vmode."bg=".s:background  ."'"
exe "let s:bg_green     = ' ".s:vmode."bg=".s:keyword  ."'"
exe "let s:bg_yellow    = ' ".s:vmode."bg=".s:type ."'"
exe "let s:bg_orange    = ' ".s:vmode."bg=".s:vars ."'"
exe "let s:bg_red       = ' ".s:vmode."bg=".s:foreground    ."'"
exe "let s:bg_magenta   = ' ".s:vmode."bg=".s:todo."'"
exe "let s:bg_violet    = ' ".s:vmode."bg=".s:underlined ."'"
exe "let s:bg_blue      = ' ".s:vmode."bg=".s:definition   ."'"
exe "let s:bg_cyan      = ' ".s:vmode."bg=".s:string   ."'"

exe "let s:fg_none      = ' ".s:vmode."fg=".s:none   ."'"
exe "let s:fg_back      = ' ".s:vmode."fg=".s:back   ."'"
exe "let s:fg_base2    = ' ".s:vmode."fg=".s:status_line ."'"
exe "let s:fg_base01    = ' ".s:vmode."fg=".s:comment ."'"
exe "let s:fg_base00    = ' ".s:vmode."fg=".s:status_line ."'"
exe "let s:fg_base0     = ' ".s:vmode."fg=".s:foreground  ."'"
exe "let s:fg_base1     = ' ".s:vmode."fg=".s:cursor_line  ."'"
exe "let s:fg_base2     = ' ".s:vmode."fg=".s:status_line  ."'"
exe "let s:fg_base3     = ' ".s:vmode."fg=".s:background  ."'"
exe "let s:fg_base03     = ' ".s:vmode."fg=".s:background  ."'"
exe "let s:fg_green     = ' ".s:vmode."fg=".s:keyword  ."'"
exe "let s:fg_yellow    = ' ".s:vmode."fg=".s:type ."'"
exe "let s:fg_orange    = ' ".s:vmode."fg=".s:vars ."'"
exe "let s:fg_red       = ' ".s:vmode."fg=".s:foreground    ."'"
exe "let s:fg_magenta   = ' ".s:vmode."fg=".s:todo."'"
exe "let s:fg_violet    = ' ".s:vmode."fg=".s:underlined ."'"
exe "let s:fg_blue      = ' ".s:vmode."fg=".s:definition   ."'"
exe "let s:fg_cyan      = ' ".s:vmode."fg=".s:string   ."'"

exe "let s:fmt_none     = ' ".s:vmode."=NONE".          " term=NONE".    "'"
exe "let s:fmt_bold     = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b."'"
exe "let s:fmt_bldi     = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b."'"
exe "let s:fmt_undr     = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u."'"
exe "let s:fmt_undb     = ' ".s:vmode."=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi     = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u."'"
exe "let s:fmt_uopt     = ' ".s:vmode."=NONE".s:ou.     " term=NONE".s:ou."'"
exe "let s:fmt_curl     = ' ".s:vmode."=NONE".s:c.      " term=NONE".s:c."'"
exe "let s:fmt_ital     = ' ".s:vmode."=NONE".          " term=NONE".    "'"
exe "let s:fmt_revr     = ' ".s:vmode."=NONE".s:r.      " term=NONE".s:r."'"
exe "let s:fmt_stnd     = ' ".s:vmode."=NONE".s:s.      " term=NONE".s:s."'"

if has("gui_running")
  exe "let s:sp_none      = ' guisp=".s:none   ."'"
  exe "let s:sp_back      = ' guisp=".s:back   ."'"
  exe "let s:sp_base2    = ' guisp=".s:status_line ."'"
  exe "let s:sp_base01    = ' guisp=".s:comment ."'"
  exe "let s:sp_base00    = ' guisp=".s:status_line ."'"
  exe "let s:sp_base0     = ' guisp=".s:foreground  ."'"
  exe "let s:sp_base1     = ' guisp=".s:cursor_line  ."'"
  exe "let s:sp_base2     = ' guisp=".s:status_line  ."'"
  exe "let s:sp_base3     = ' guisp=".s:background  ."'"
  exe "let s:sp_base03     = ' guisp=".s:background  ."'"
  exe "let s:sp_green     = ' guisp=".s:keyword  ."'"
  exe "let s:sp_yellow    = ' guisp=".s:type ."'"
  exe "let s:sp_orange    = ' guisp=".s:vars ."'"
  exe "let s:sp_red       = ' guisp=".s:foreground    ."'"
  exe "let s:sp_magenta   = ' guisp=".s:todo."'"
  exe "let s:sp_violet    = ' guisp=".s:underlined ."'"
  exe "let s:sp_blue      = ' guisp=".s:definition   ."'"
  exe "let s:sp_cyan      = ' guisp=".s:string   ."'"
else
  let s:sp_none      = ""
  let s:sp_back      = ""
  let s:sp_base03    = ""
  let s:sp_base2    = ""
  let s:sp_base01    = ""
  let s:sp_base00    = ""
  let s:sp_base0     = ""
  let s:sp_base1     = ""
  let s:sp_base2     = ""
  let s:sp_base3     = ""
  let s:sp_green     = ""
  let s:sp_yellow    = ""
  let s:sp_orange    = ""
  let s:sp_red       = ""
  let s:sp_magenta   = ""
  let s:sp_violet    = ""
  let s:sp_blue      = ""
  let s:sp_cyan      = ""
endif


exe "hi! Normal"         .s:fmt_none   .s:fg_base0  .s:bg_back
exe "hi! Comment"        .s:fmt_ital   .s:fg_base01 .s:bg_none
exe "hi! Constant"       .s:fmt_none   .s:fg_cyan   .s:bg_none
exe "hi! Identifier"     .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! Statement"      .s:fmt_none   .s:fg_green  .s:bg_none
exe "hi! PreProc"        .s:fmt_none   .s:fg_orange .s:bg_none
exe "hi! Type"           .s:fmt_none   .s:fg_yellow .s:bg_none
exe "hi! Special"        .s:fmt_none   .s:fg_red    .s:bg_none
exe "hi! Underlined"     .s:fmt_none   .s:fg_violet .s:bg_none
exe "hi! Ignore"         .s:fmt_none   .s:fg_none   .s:bg_none
exe "hi! Error"          .s:fmt_bold   .s:fg_red    .s:bg_none
exe "hi! Todo"           .s:fmt_bold   .s:fg_magenta.s:bg_none
if (has("gui_running")) || &t_Co > 8
  exe "hi! StatusLine"     .s:fmt_none   .s:fg_base2 .s:bg_base1
  exe "hi! StatusLineNC"   .s:fmt_none   .s:fg_base2 .s:bg_base00
  exe "hi! Visual"         .s:fmt_none   .s:fg_base03 .s:bg_base01
else
  exe "hi! StatusLine"     .s:fmt_none   .s:fg_base2 .s:bg_base2
  exe "hi! StatusLineNC"   .s:fmt_none   .s:fg_base2 .s:bg_base2
  exe "hi! Visual"         .s:fmt_none   .s:fg_none   .s:bg_base2
endif
exe "hi! Directory"      .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! ErrorMsg"       .s:fmt_revr   .s:fg_red    .s:bg_none
exe "hi! IncSearch"      .s:fmt_stnd   .s:fg_orange .s:bg_none
exe "hi! Search"         .s:fmt_revr   .s:fg_yellow .s:bg_none
exe "hi! MoreMsg"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! ModeMsg"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! LineNr"         .s:fmt_none   .s:fg_base01 .s:bg_base2
exe "hi! Question"       .s:fmt_bold   .s:fg_cyan   .s:bg_none
exe "hi! VertSplit"      .s:fmt_bold   .s:fg_base00 .s:bg_base00
exe "hi! Title"          .s:fmt_bold   .s:fg_orange .s:bg_none
exe "hi! VisualNOS"      .s:fmt_stnd   .s:fg_none   .s:bg_base2
exe "hi! WarningMsg"     .s:fmt_bold   .s:fg_red    .s:bg_none
exe "hi! WildMenu"       .s:fmt_none   .s:fg_base2  .s:bg_base2
exe "hi! Folded"         .s:fmt_undb   .s:fg_base0  .s:bg_base2  .s:sp_base03
exe "hi! FoldColumn"     .s:fmt_bold   .s:fg_base0  .s:bg_base2
exe "hi! DiffAdd"        .s:fmt_revr   .s:fg_green  .s:bg_none
exe "hi! DiffChange"     .s:fmt_revr   .s:fg_yellow .s:bg_none
exe "hi! DiffDelete"     .s:fmt_revr   .s:fg_red    .s:bg_none
exe "hi! DiffText"       .s:fmt_revr   .s:fg_blue   .s:bg_none
exe "hi! SignColumn"     .s:fmt_none   .s:fg_base0  .s:bg_base2
exe "hi! Conceal"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! SpellBad"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_red
exe "hi! SpellCap"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_violet
exe "hi! SpellRare"      .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_cyan
exe "hi! SpellLocal"     .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_yellow
exe "hi! Pmenu"          .s:fmt_none   .s:fg_base0  .s:bg_base2
exe "hi! PmenuSel"       .s:fmt_none   .s:fg_base2  .s:bg_base01
exe "hi! PmenuSbar"      .s:fmt_none   .s:fg_base0  .s:bg_base2
exe "hi! PmenuThumb"     .s:fmt_none   .s:fg_base03 .s:bg_base0
exe "hi! TabLine"        .s:fmt_undr   .s:fg_base0  .s:bg_base2  .s:sp_base0
exe "hi! TabLineSel"     .s:fmt_undr   .s:fg_base2  .s:bg_base01  .s:sp_base0
exe "hi! TabLineFill"    .s:fmt_undr   .s:fg_base0  .s:bg_base2  .s:sp_base0
exe "hi! CursorColumn"   .s:fmt_none   .s:fg_none   .s:bg_base2
exe "hi! CursorLine"     .s:fmt_uopt   .s:fg_none   .s:bg_base2  .s:sp_base1
exe "hi! ColorColumn"    .s:fmt_none   .s:fg_none   .s:bg_base2
exe "hi! Cursor"         .s:fmt_none   .s:fg_base03 .s:bg_base0
hi! link lCursor Cursor
exe "hi! MatchParen"     .s:fmt_bold   .s:fg_red    .s:bg_base01

exe "hi! cPreCondit". s:fg_orange.s:bg_none   .s:fmt_none

exe "hi! VarId"    . s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! ConId"    . s:fg_yellow .s:bg_none   .s:fmt_none

autocmd GUIEnter * if (s:vmode != "gui") | exe "colorscheme " . g:colors_name | endif
