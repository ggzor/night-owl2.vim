if !has('gui_running') && &t_Co < 256
  finish
endif

set background=dark

highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "nightowl2"

function! s:h(group, style) abort
  execute "highlight" a:group
    \ "guifg=" (has_key(a:style, "fg")  ? a:style.fg  : "NONE")
    \ "guibg=" (has_key(a:style, "bg")  ? a:style.bg  : "NONE")
    \ "guisp=" (has_key(a:style, "sp")  ? a:style.sp  : "NONE")
    \ "gui="   (has_key(a:style, "gui") ? a:style.gui : "NONE")
endfunction

let p = nightowl2#palette#create()

" Vim UI
call s:h("Normal"       , p.fg.fg)
call s:h("EndOfBuffer"  , p.hidden)

call s:h("CursorLine"   , p.bg.bg_dark)
call s:h("CursorColumn" , p.bg.bg)
call s:h("ColorColumn"  , p.bg.fg40)
call s:h("CursorLineNr" , { 'fg': p.color.fg     , 'bg': p.color.fg10 })
call s:h("LineNr"       , p.fg.fg25)
call s:h("MatchParen"   , p.bg.fg20)
call s:h("SignColumn"   , p.hidden)
call s:h("FoldColumn"   , p.hidden)
call s:h("Search"       , p.bg.blue25)
call s:h("IncSearch"    , { 'gui': 'bold'        , 'bg': p.color.blue65 })
call s:h("Title"        , p.fg.blue)
call s:h("VertSplit"    , p.fg.fg5)
call s:h("Visual"       , p.bg.magenta20)

call s:h("Folded"       , p.fg.fg35)
call s:h("StatusLine"   , p.hidden)

call s:h("MoreMsg"      , p.fg.fg50)
call s:h("Question"     , p.fg.fg90)
call s:h("ErrorMsg"     , p.fg.red)

call s:h("DiffAdd"      , p.bg.diff_add15)
call s:h("DiffChange"   , p.bg.diff_change15)
call s:h("DiffText"     , p.bg.diff_delete30)
call s:h("DiffDelete"   , { 'bg': p.color.bg_dark, 'fg': p.color.bg_dark })

" Diff patch
call s:h("DiffOldAdd"   , p.bg.diff_delete15)
call s:h("DiffOldChange", p.bg.diff_delete15)
call s:h("DiffOldText"  , p.bg.diff_delete40)

call s:h("Pmenu"        , p.bg.bg_light)
call s:h("PmenuSel"     , p.bg.bg_blue)
call s:h("PmenuSbar"    , p.bg.bg_light)
call s:h("PmenuThumb"   , p.bg.bg_scroll)

" Old highlighting
call s:h("Comment"       , p.fg.italic.fg50)

call s:h("Constant"      , p.fg.red)
call s:h("String"        , p.fg.yellow)
call s:h("Character"     , p.fg.yellow)
call s:h("Number"        , p.fg.orange)
call s:h("Boolean"       , p.fg.fg)
call s:h("Float"         , p.fg.fg)

call s:h("Identifier"    , p.fg.cyan)
call s:h("Function"      , p.fg.blue)

call s:h("Statement"     , p.fg.magenta)
call s:h("Conditional"   , p.fg.magenta)
call s:h("Repeat"        , p.fg.magenta)
call s:h("Label"         , p.fg.magenta)
call s:h("Operator"      , p.fg.magenta)
call s:h("Keyword"       , p.fg.magenta)
call s:h("Exception"     , p.fg.magenta)

call s:h("PreProc"       , p.fg.magenta)
call s:h("Include"       , p.fg.magenta)
call s:h("Define"        , p.fg.magenta)
call s:h("Macro"         , p.fg.magenta)
call s:h("PreCondit"     , p.fg.magenta)

call s:h("Type"          , p.fg.magenta)
call s:h("StorageClass"  , p.fg.magenta)
call s:h("Structure"     , p.fg.magenta)
call s:h("Typedef"       , p.fg.magenta)

call s:h("Special"       , p.fg.blue)
call s:h("SpecialChar"   , p.fg.magenta)
call s:h("Tag"           , p.fg.fg)
call s:h("Delimiter"     , p.fg.fg)
call s:h("SpecialComment", p.fg.fg)
call s:h("Debug"         , p.fg.fg)

call s:h("Underlined"    , p.fg.fg)
call s:h("Ignore"        , p.fg.fg)
call s:h("Error"         , p.fg.fg)
call s:h("Todo"          , { 'gui': 'bold'  , 'fg': p.color.magenta, 'bg': p.color.magenta30 })

" Old highlighting: vim
call s:h("vimAutoCmdSfxList", p.fg.bold.blue)
call s:h("vimSet", p.fg.bold.orange)
call s:h("vimMapLhs", p.fg.orange)


" coc.nvim
call s:h("CocErrorFloat"    , p.fg.red)
call s:h("CocWarningFloat"  , p.fg.yellow_alt)
call s:h("CocFloating"      , { 'bg': p.color.fg10, 'fg': p.color.fg95 })

call s:h("CocErrorSign"     , p.fg.red)
call s:h("CocWarningSign"   , p.fg.yellow_alt)

call s:h("CocHighlightRead" , p.bg.fg15)
call s:h("CocHighlightWrite", p.bg.fg15)

" fzf
let g:fzf_colors = {
      \ 'border': ['fg', 'FZFBorder'],
      \ }

call s:h("FZFBorder", p.fg.fg20)

" gitgutter
call s:h("GitGutterAdd"              , p.fg.diff_add)
call s:h("GitGutterChange"           , p.fg.diff_change)
call s:h("GitGutterDelete"           , p.fg.diff_delete)
call s:h("GitGutterChangeDeleteLine" , p.fg.diff_delete)

" lightline
let g:lightline.colorscheme = 'nightowl2'

" vim-highlightedyank
call s:h("HighlightedyankRegion" , p.bg.yellow_alt15)

" hop.nvim
call s:h("HopUnmatched" , p.fg.fg40)

" treesitter
" TODO: Search python Keyword Argument
" TODO: Search python subscript Argument

call s:h("TSPunctDelimiter"    , p.fg.magenta)
call s:h("TSPunctBracket"      , p.fg.fg)
call s:h("TSPunctSpecial"      , p.fg.magenta)

call s:h("TSConstant"          , p.fg.italic.orange)
call s:h("TSConstBuiltin"      , p.fg.red)
call s:h("TSConstMacro"        , p.fg.fg)
call s:h("TSString"            , p.fg.yellow)
call s:h("TSStringRegex"       , p.fg.fg)
call s:h("TSStringEscape"      , p.fg.orange)
call s:h("TSCharacter"         , p.fg.orange)
call s:h("TSNumber"            , p.fg.orange)
call s:h("TSBoolean"           , p.fg.red)
call s:h("TSFloat"             , p.fg.orange)

call s:h("TSFunction"          , p.fg.italic.blue)
call s:h("TSFuncBuiltin"       , p.fg.italic.lime)
call s:h("TSFuncMacro"         , p.fg.fg)
call s:h("TSParameter"         , p.fg.cyan)
call s:h("TSParameterReference", p.fg.fg)
call s:h("TSMethod"            , p.fg.italic.blue)
call s:h("TSField"             , p.fg.cyan)
call s:h("TSProperty"          , p.fg.cyan)
call s:h("TSConstructor"       , p.fg.blue)
call s:h("TSAnnotation"        , p.fg.magenta)
call s:h("TSAttribute"         , p.fg.magenta)
call s:h("TSNamespace"         , p.fg.fg)
call s:h("TSSymbol"            , p.fg.fg)

call s:h("TSConditional"       , p.fg.magenta)
call s:h("TSRepeat"            , p.fg.magenta)
call s:h("TSLabel"             , p.fg.magenta)
call s:h("TSOperator"          , p.fg.magenta)
call s:h("TSKeyword"           , p.fg.magenta)
call s:h("TSKeywordFunction"   , p.fg.magenta)
call s:h("TSKeywordOperator"   , p.fg.magenta)
call s:h("TSException"         , p.fg.magenta)

call s:h("TSType"              , p.fg.magenta)
call s:h("TSTypeBuiltin"       , p.fg.italic.magenta)
call s:h("TSInclude"           , p.fg.magenta)

call s:h("TSVariableBuiltin"   , p.fg.magenta)

call s:h("TSText"              , p.fg.fg)
call s:h("TSStrong"            , p.fg.fg)
call s:h("TSEmphasis"          , p.fg.fg)
call s:h("TSUnderline"         , p.fg.fg)
call s:h("TSStrike"            , p.fg.fg)
call s:h("TSMath"              , p.fg.fg)
call s:h("TSTextReference"     , p.fg.fg)
call s:h("TSEnviroment"        , p.fg.fg)
call s:h("TSEnviromentName"    , p.fg.fg)
call s:h("TSTitle"             , p.fg.fg)
call s:h("TSLiteral"           , p.fg.magenta)
call s:h("TSURI"               , p.fg.fg)

call s:h("TSComment"           , p.fg.italic.fg50)
call s:h("TSNote"              , p.fg.fg)
call s:h("TSWarning"           , p.fg.fg)
call s:h("TSDanger"            , p.fg.fg)

call s:h("TSTag"               , p.fg.blue)
call s:h("TSTagDelimiter"      , p.fg.blue)

" treesitter-rainbow
call s:h("rainbowcol1", { 'fg': '#f3dbb9' })
call s:h("rainbowcol2", { 'fg': '#f49190' })
call s:h("rainbowcol3", { 'fg': '#adc7ff' })
call s:h("rainbowcol4", { 'fg': '#badb94' })
call s:h("rainbowcol5", { 'fg': '#c792ea' })
call s:h("rainbowcol6", { 'fg': '#979287' })
call s:h("rainbowcol7", { 'fg': '#f75590' })

" ShowMotion
call s:h("ShowMotion_CharSearchGroup", { 'fg': 'red', 'gui': 'bold' })
