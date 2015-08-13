" Vim Colors:
" Moonshine 
"
" http://ercote.me
"
" Default GUI Colours


let s:background = "3a5683"
let s:foreground = "f2e9e4"
let s:comment = "919098"
let s:vars = "dec0f1"
let s:definition = "d0c4df"
let s:constant = "e0a458"
let s:string = "f4b9b2"
let s:selection = "1b065e"
let s:operators = "cdc6a5"
let s:line = "1b065e"
let s:window = "1b065e"

set background=light
hi clear
syntax reset

let g:colors_name = "moonshine"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
  " Returns an approximate grey index for the given grey level
  fun <SID>grey_number(x)
    if &t_Co == 88
      if a:x < 23
        return 0
      elseif a:x < 69
        return 1
      elseif a:x < 103
        return 2
      elseif a:x < 127
        return 3
      elseif a:x < 150
        return 4
      elseif a:x < 173
        return 5
      elseif a:x < 196
        return 6
      elseif a:x < 219
        return 7
      elseif a:x < 243
        return 8
      else
        return 9
      endif
    else
      if a:x < 14
        return 0
      else
        let l:n = (a:x - 8) / 10
        let l:m = (a:x - 8) % 10
        if l:m < 5
          return l:n
        else
          return l:n + 1
        endif
      endif
    endif
  endfun

  " Returns the actual grey level represented by the grey index
  fun <SID>grey_level(n)
    if &t_Co == 88
      if a:n == 0
        return 0
      elseif a:n == 1
        return 46
      elseif a:n == 2
        return 92
      elseif a:n == 3
        return 115
      elseif a:n == 4
        return 139
      elseif a:n == 5
        return 162
      elseif a:n == 6
        return 185
      elseif a:n == 7
        return 208
      elseif a:n == 8
        return 231
      else
        return 255
      endif
    else
      if a:n == 0
        return 0
      else
        return 8 + (a:n * 10)
      endif
    endif
  endfun

  " Returns the palette index for the given grey index
  fun <SID>grey_colour(n)
    if &t_Co == 88
      if a:n == 0
        return 16
      elseif a:n == 9
        return 79
      else
        return 79 + a:n
      endif
    else
      if a:n == 0
        return 16
      elseif a:n == 25
        return 231
      else
        return 231 + a:n
      endif
    endif
  endfun

  " Returns an approximate colour index for the given colour level
  fun <SID>rgb_number(x)
    if &t_Co == 88
      if a:x < 69
        return 0
      elseif a:x < 172
        return 1
      elseif a:x < 230
        return 2
      else
        return 3
      endif
    else
      if a:x < 75
        return 0
      else
        let l:n = (a:x - 55) / 40
        let l:m = (a:x - 55) % 40
        if l:m < 20
          return l:n
        else
          return l:n + 1
        endif
      endif
    endif
  endfun

  " Returns the actual colour level for the given colour index
  fun <SID>rgb_level(n)
    if &t_Co == 88
      if a:n == 0
        return 0
      elseif a:n == 1
        return 139
      elseif a:n == 2
        return 205
      else
        return 255
      endif
    else
      if a:n == 0
        return 0
      else
        return 55 + (a:n * 40)
      endif
    endif
  endfun

  " Returns the palette index for the given R/G/B colour indices
  fun <SID>rgb_colour(x, y, z)
    if &t_Co == 88
      return 16 + (a:x * 16) + (a:y * 4) + a:z
    else
      return 16 + (a:x * 36) + (a:y * 6) + a:z
    endif
  endfun

  " Returns the palette index to approximate the given R/G/B colour levels
  fun <SID>colour(r, g, b)
    " Get the closest grey
    let l:gx = <SID>grey_number(a:r)
    let l:gy = <SID>grey_number(a:g)
    let l:gz = <SID>grey_number(a:b)

    " Get the closest colour
    let l:x = <SID>rgb_number(a:r)
    let l:y = <SID>rgb_number(a:g)
    let l:z = <SID>rgb_number(a:b)

    if l:gx == l:gy && l:gy == l:gz
      " There are two possibilities
      let l:dgr = <SID>grey_level(l:gx) - a:r
      let l:dgg = <SID>grey_level(l:gy) - a:g
      let l:dgb = <SID>grey_level(l:gz) - a:b
      let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
      let l:dr = <SID>rgb_level(l:gx) - a:r
      let l:dg = <SID>rgb_level(l:gy) - a:g
      let l:db = <SID>rgb_level(l:gz) - a:b
      let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
      if l:dgrey < l:drgb
        " Use the grey
        return <SID>grey_colour(l:gx)
      else
        " Use the colour
        return <SID>rgb_colour(l:x, l:y, l:z)
      endif
    else
      " Only one possibility
      return <SID>rgb_colour(l:x, l:y, l:z)
    endif
  endfun

  " Returns the palette index to approximate the 'rrggbb' hex string
  fun <SID>rgb(rgb)
    let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
    let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
    let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

    return <SID>colour(l:r, l:g, l:b)
  endfun

  " Sets the highlighting for the given group
  fun <SID>X(group, fg, bg, attr)
    if a:fg != ""
      exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
    endif
    if a:bg != ""
      exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
    endif
    if a:attr != ""
      exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
    endif
  endfun


  " Vim Highlighting
  call <SID>X("Normal", s:foreground, s:background, "")
  highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
  call <SID>X("NonText", s:selection, "", "")
  call <SID>X("SpecialKey", s:selection, "", "")
  call <SID>X("Search", s:foreground, s:constant, "")
  call <SID>X("TabLine", s:window, s:foreground, "reverse")
  call <SID>X("TabLineFill", s:window, s:foreground, "reverse")
  call <SID>X("StatusLine", s:window, s:constant, "reverse")
  call <SID>X("StatusLineNC", s:window, s:foreground, "reverse")
  call <SID>X("VertSplit", s:window, s:window, "none")
  call <SID>X("Visual", "", s:selection, "")
  call <SID>X("Directory", s:definition, "", "")
  call <SID>X("ModeMsg", s:vars, "", "")
  call <SID>X("MoreMsg", s:vars, "", "")
  call <SID>X("Question", s:vars, "", "")
  call <SID>X("WarningMsg", s:definition, "", "")
  call <SID>X("MatchParen", "", s:selection, "")
  call <SID>X("Folded", s:comment, s:background, "")
  call <SID>X("FoldColumn", "", s:background, "")
  if version >= 700
    call <SID>X("CursorLine", "", s:line, "none")
    call <SID>X("CursorColumn", "", s:line, "none")
    call <SID>X("PMenu", s:foreground, s:selection, "none")
    call <SID>X("PMenuSel", s:foreground, s:selection, "reverse")
    call <SID>X("SignColumn", "", s:background, "none")
  end
  if version >= 703
    call <SID>X("ColorColumn", "", s:line, "none")
  end

  " Standard Highlighting
  call <SID>X("Comment", s:comment, "", "")
  call <SID>X("Todo", s:comment, s:background, "")
  call <SID>X("Title", s:comment, "", "")
  call <SID>X("Identifier", s:definition, "", "none")
  call <SID>X("Statement", s:foreground, "", "")
  call <SID>X("Conditional", s:foreground, "", "")
  call <SID>X("Repeat", s:foreground, "", "")
  call <SID>X("Structure", s:constant, "", "")
  call <SID>X("Function", s:definition, "", "")
  call <SID>X("Constant", s:foreground, "", "")
  call <SID>X("Keyword", s:foreground, "", "")
  call <SID>X("String", s:string, "", "")
  call <SID>X("Special", s:foreground, "", "")
  call <SID>X("PreProc", s:constant, "", "")
  call <SID>X("Operator", s:operators, "", "none")
  call <SID>X("Type", s:definition, "", "none")
  call <SID>X("Define", s:constant, "", "none")
  call <SID>X("Include", s:definition, "", "")
  "call <SID>X("Ignore", "666666", "", "")

  " Vim Highlighting
  call <SID>X("vimCommand", s:foreground, "", "none")

  " C Highlighting
  call <SID>X("cType", s:constant, "", "")
  call <SID>X("cStorageClass", s:constant, "", "")
  call <SID>X("cConditional", s:constant, "", "")
  call <SID>X("cRepeat", s:constant, "", "")

  " PHP Highlighting
  call <SID>X("phpVarSelector", s:definition, "", "")
  call <SID>X("phpKeyword", s:constant, "", "")
  call <SID>X("phpRepeat", s:constant, "", "")
  call <SID>X("phpConditional", s:constant, "", "")
  call <SID>X("phpStatement", s:constant, "", "")
  call <SID>X("phpMemberSelector", s:foreground, "", "")

  " Ruby Highlighting
  call <SID>X("rubySymbol", s:vars, "", "")
  call <SID>X("rubyConstant", s:constant, "", "")
  call <SID>X("rubyAccess", s:constant, "", "")
  call <SID>X("rubyAttribute", s:definition, "", "")
  call <SID>X("rubyInclude", s:definition, "", "")
  call <SID>X("rubyLocalVariableOrMethod", s:foreground, "", "")
  call <SID>X("rubyCurlyBlock", s:foreground, "", "")
  call <SID>X("rubyStringDelimiter", s:string, "", "")
  call <SID>X("rubyInterpolationDelimiter", s:foreground, "", "")
  call <SID>X("rubyConditional", s:constant, "", "")
  call <SID>X("rubyRepeat", s:constant, "", "")
  call <SID>X("rubyControl", s:constant, "", "")
  call <SID>X("rubyException", s:constant, "", "")

  " Crystal Highlighting
  call <SID>X("crystalSymbol", s:vars, "", "")
  call <SID>X("crystalConstant", s:constant, "", "")
  call <SID>X("crystalAccess", s:constant, "", "")
  call <SID>X("crystalAttribute", s:definition, "", "")
  call <SID>X("crystalInclude", s:definition, "", "")
  call <SID>X("crystalLocalVariableOrMethod", s:foreground, "", "")
  call <SID>X("crystalCurlyBlock", s:foreground, "", "")
  call <SID>X("crystalStringDelimiter", s:string, "", "")
  call <SID>X("crystalInterpolationDelimiter", s:foreground, "", "")
  call <SID>X("crystalConditional", s:constant, "", "")
  call <SID>X("crystalRepeat", s:constant, "", "")
  call <SID>X("crystalControl", s:constant, "", "")
  call <SID>X("crystalException", s:constant, "", "")

  " Python Highlighting
  call <SID>X("pythonInclude", s:constant, "", "")
  call <SID>X("pythonStatement", s:constant, "", "")
  call <SID>X("pythonConditional", s:constant, "", "")
  call <SID>X("pythonRepeat", s:constant, "", "")
  call <SID>X("pythonException", s:constant, "", "")
  call <SID>X("pythonFunction", s:definition, "", "")
  call <SID>X("pythonPreCondit", s:constant, "", "")
  call <SID>X("pythonRepeat", s:operators, "", "")
  call <SID>X("pythonExClass", s:foreground, "", "")

  " JavaScript Highlighting
  call <SID>X("javaScriptBraces", s:foreground, "", "")
  call <SID>X("javaScriptFunction", s:constant, "", "")
  call <SID>X("javaScriptConditional", s:constant, "", "")
  call <SID>X("javaScriptRepeat", s:constant, "", "")
  call <SID>X("javaScriptNumber", s:foreground, "", "")
  call <SID>X("javaScriptMember", s:foreground, "", "")
  call <SID>X("javascriptNull", s:foreground, "", "")
  call <SID>X("javascriptGlobal", s:definition, "", "")
  call <SID>X("javascriptStatement", s:definition, "", "")

  " CoffeeScript Highlighting
  call <SID>X("coffeeRepeat", s:constant, "", "")
  call <SID>X("coffeeConditional", s:constant, "", "")
  call <SID>X("coffeeKeyword", s:constant, "", "")
  call <SID>X("coffeeObject", s:constant, "", "")

  " HTML Highlighting
  call <SID>X("htmlTag", s:definition, "", "")
  call <SID>X("htmlTagName", s:definition, "", "")
  call <SID>X("htmlArg", s:definition, "", "")
  call <SID>X("htmlScriptTag", s:definition, "", "")

  " ShowMarks Highlighting
  call <SID>X("ShowMarksHLl", s:foreground, s:background, "none")
  call <SID>X("ShowMarksHLo", s:constant, s:background, "none")
  call <SID>X("ShowMarksHLu", s:constant, s:background, "none")
  call <SID>X("ShowMarksHLm", s:operators, s:background, "none")

  " Lua Highlighting
  call <SID>X("luaStatement", s:constant, "", "")
  call <SID>X("luaRepeat", s:constant, "", "")
  call <SID>X("luaCondStart", s:constant, "", "")
  call <SID>X("luaCondElseif", s:constant, "", "")
  call <SID>X("luaCond", s:constant, "", "")
  call <SID>X("luaCondEnd", s:constant, "", "")

  " Cucumber Highlighting
  call <SID>X("cucumberGiven", s:definition, "", "")
  call <SID>X("cucumberGivenAnd", s:definition, "", "")

  " Go Highlighting
  call <SID>X("goDirective", s:constant, "", "")
  call <SID>X("goDeclaration", s:constant, "", "")
  call <SID>X("goStatement", s:constant, "", "")
  call <SID>X("goConditional", s:constant, "", "")
  call <SID>X("goConstants", s:foreground, "", "")
  call <SID>X("goTodo", s:constant, "", "")
  call <SID>X("goDeclType", s:definition, "", "")
  call <SID>X("goBuiltins", s:constant, "", "")
  call <SID>X("goRepeat", s:constant, "", "")
  call <SID>X("goLabel", s:constant, "", "")

  " Clojure Highlighting
  call <SID>X("clojureConstant", s:foreground, "", "")
  call <SID>X("clojureBoolean", s:foreground, "", "")
  call <SID>X("clojureCharacter", s:foreground, "", "")
  call <SID>X("clojureKeyword", s:vars, "", "")
  call <SID>X("clojureNumber", s:foreground, "", "")
  call <SID>X("clojureString", s:string, "", "")
  call <SID>X("clojureRegexp", s:vars, "", "")
  call <SID>X("clojureParen", s:operators, "", "")
  call <SID>X("clojureVariable", s:constant, "", "")
  call <SID>X("clojureCond", s:definition, "", "")
  call <SID>X("clojureDefine", s:constant, "", "")
  call <SID>X("clojureException", s:definition, "", "")
  call <SID>X("clojureFunc", s:definition, "", "")
  call <SID>X("clojureMacro", s:definition, "", "")
  call <SID>X("clojureRepeat", s:definition, "", "")
  call <SID>X("clojureSpecial", s:constant, "", "")
  call <SID>X("clojureQuote", s:definition, "", "")
  call <SID>X("clojureUnquote", s:definition, "", "")
  call <SID>X("clojureMeta", s:definition, "", "")
  call <SID>X("clojureDeref", s:definition, "", "")
  call <SID>X("clojureAnonArg", s:definition, "", "")
  call <SID>X("clojureRepeat", s:definition, "", "")
  call <SID>X("clojureDispatch", s:definition, "", "")

  " Scala Highlighting
  call <SID>X("scalaKeyword", s:constant, "", "")
  call <SID>X("scalaKeywordModifier", s:constant, "", "")
  call <SID>X("scalaOperator", s:definition, "", "")
  call <SID>X("scalaPackage", s:definition, "", "")
  call <SID>X("scalaFqn", s:foreground, "", "")
  call <SID>X("scalaFqnSet", s:foreground, "", "")
  call <SID>X("scalaImport", s:constant, "", "")
  call <SID>X("scalaBoolean", s:foreground, "", "")
  call <SID>X("scalaDef", s:constant, "", "")
  call <SID>X("scalaVal", s:constant, "", "")
  call <SID>X("scalaVar", s:operators, "", "")
  call <SID>X("scalaClass", s:constant, "", "")
  call <SID>X("scalaObject", s:constant, "", "")
  call <SID>X("scalaTrait", s:constant, "", "")
  call <SID>X("scalaDefName", s:definition, "", "")
  call <SID>X("scalaValName", s:foreground, "", "")
  call <SID>X("scalaVarName", s:foreground, "", "")
  call <SID>X("scalaClassName", s:foreground, "", "")
  call <SID>X("scalaType", s:constant, "", "")
  call <SID>X("scalaTypeSpecializer", s:constant, "", "")
  call <SID>X("scalaAnnotation", s:foreground, "", "")
  call <SID>X("scalaNumber", s:foreground, "", "")
  call <SID>X("scalaDefSpecializer", s:constant, "", "")
  call <SID>X("scalaClassSpecializer", s:constant, "", "")
  call <SID>X("scalaBackTick", s:vars, "", "")
  call <SID>X("scalaRoot", s:foreground, "", "")
  call <SID>X("scalaMethodCall", s:definition, "", "")
  call <SID>X("scalaCaseType", s:constant, "", "")
  call <SID>X("scalaLineComment", s:comment, "", "")
  call <SID>X("scalaComment", s:comment, "", "")
  call <SID>X("scalaDocComment", s:comment, "", "")
  call <SID>X("scalaDocTags", s:comment, "", "")
  call <SID>X("scalaEmptyString", s:string, "", "")
  call <SID>X("scalaMultiLineString", s:string, "", "")
  call <SID>X("scalaUnicode", s:foreground, "", "")
  call <SID>X("scalaString", s:string, "", "")
  call <SID>X("scalaStringEscape", s:vars, "", "")
  call <SID>X("scalaSymbol", s:foreground, "", "")
  call <SID>X("scalaChar", s:foreground, "", "")
  call <SID>X("scalaXml", s:vars, "", "")
  call <SID>X("scalaConstructorSpecializer", s:constant, "", "")
  call <SID>X("scalaBackTick", s:definition, "", "")

  " Git
  call <SID>X("diffAdded", s:vars, "", "")
  call <SID>X("diffRemoved", s:definition, "", "")
  call <SID>X("gitcommitSummary", "", "", "bold")

  " Delete Functions
  delf <SID>X
  delf <SID>rgb
  delf <SID>colour
  delf <SID>rgb_colour
  delf <SID>rgb_level
  delf <SID>rgb_number
  delf <SID>grey_colour
  delf <SID>grey_level
  delf <SID>grey_number
endif

