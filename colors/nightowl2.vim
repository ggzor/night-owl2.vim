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
    \ "cterm=NONE"
    \ "ctermfg=NONE"
    \ "ctermbg=NONE"
    \ "term=NONE"
endfunction

function! s:highlight_groups(groups) abort
  for k in keys(a:groups)
    call s:h(k, a:groups[k])
  endfor
endfunction

function! s:link_to(target, groups) abort
  for g in a:groups
    execute "highlight link" g a:target
  endfor
endfunction

let p = nightowl2#palette#create()

" Vim UI
call s:highlight_groups({
  \ 'Normal'     : p.fg.fg,
  \ 'EndOfBuffer': p.hidden,
  \
  \ 'CursorLine'  : p.bg.bg_dark,
  \ 'CursorColumn': p.bg.bg,
  \ 'ColorColumn' : p.bg.fg40,
  \ 'CursorLineNr': { 'fg': p.color.fg, 'bg': p.color.fg10 },
  \ 'LineNr'      : p.fg.fg25,
  \ 'MatchParen'  : p.bg.fg20,
  \ 'SignColumn'  : p.hidden,
  \ 'FoldColumn'  : p.hidden,
  \ 'Search'      : p.bg.blue25,
  \ 'IncSearch'   : { 'gui': 'bold', 'bg': p.color.blue65 },
  \ 'Title'       : p.fg.bold.blue,
  \ 'VertSplit'   : p.fg.fg5,
  \ 'Visual'      : p.bg.magenta20,
  \
  \ 'Folded'    : p.fg.fg35,
  \ 'StatusLine': p.hidden,
  \
  \ 'MoreMsg' : p.fg.fg50,
  \ 'Question': p.fg.fg90,
  \ 'ErrorMsg': p.fg.red,
  \
  \ 'DiffAdd'   : p.bg.diff_add15,
  \ 'DiffChange': p.bg.diff_change15,
  \ 'DiffText'  : p.bg.diff_delete30,
  \ 'DiffDelete': { 'bg': p.color.bg_dark, 'fg': p.color.bg_dark },
  \
  \ 'DiffOldAdd'   : p.bg.diff_delete15,
  \ 'DiffOldChange': p.bg.diff_delete15,
  \ 'DiffOldText'  : p.bg.diff_delete40,
  \
  \ 'Pmenu'     : p.bg.bg_light,
  \ 'PmenuSel'  : p.bg.bg_blue,
  \ 'PmenuSbar' : p.bg.bg_light,
  \ 'PmenuThumb': p.bg.bg_scroll,
  \ })


" Old highlighting
call s:highlight_groups({
  \ 'Comment': p.fg.italic.fg50,
  \
  \ 'Constant' : p.fg.red,
  \ 'String'   : p.fg.yellow,
  \ 'Character': p.fg.yellow,
  \ 'Number'   : p.fg.orange,
  \ 'Boolean'  : p.fg.fg,
  \ 'Float'    : p.fg.fg,
  \
  \ 'Identifier': p.fg.cyan,
  \ 'Function'  : p.fg.blue,
  \
  \ 'Statement'  : p.fg.magenta,
  \ 'Conditional': p.fg.magenta,
  \ 'Repeat'     : p.fg.magenta,
  \ 'Label'      : p.fg.magenta,
  \ 'Operator'   : p.fg.magenta,
  \ 'Keyword'    : p.fg.magenta,
  \ 'Exception'  : p.fg.magenta,
  \
  \ 'PreProc'  : p.fg.magenta,
  \ 'Include'  : p.fg.magenta,
  \ 'Define'   : p.fg.magenta,
  \ 'Macro'    : p.fg.magenta,
  \ 'PreCondit': p.fg.magenta,
  \
  \ 'Type'        : p.fg.magenta,
  \ 'StorageClass': p.fg.magenta,
  \ 'Structure'   : p.fg.magenta,
  \ 'Typedef'     : p.fg.magenta,
  \
  \ 'Special'       : p.fg.blue,
  \ 'SpecialChar'   : p.fg.magenta,
  \ 'Tag'           : p.fg.italic.lime,
  \ 'Delimiter'     : p.fg.fg,
  \ 'SpecialComment': { 'gui': 'bold', 'fg': p.color.magenta, 'bg': p.color.magenta30 },
  \ 'Debug'         : p.fg.fg,
  \
  \ 'Underlined': { 'gui': 'underline,italic', 'fg': p.color.lime },
  \ 'Ignore'    : p.fg.fg,
  \ 'Error'     : p.fg.red,
  \ 'Todo'      : { 'gui': 'bold', 'fg': p.color.magenta, 'bg': p.color.magenta30 },
  \ })

" Old highlighting: vim
call s:highlight_groups({
  \ 'vimAutoCmdSfxList': p.fg.bold.blue,
  \ 'vimSet'           : p.fg.bold.orange,
  \ 'vimMapLhs'        : p.fg.orange,
  \ })

" Old highlighting: idris
call s:link_to('Comment', [
	\	'idrisPragma',
  \ ])

" Plugins highlighting

" coc.nvim
call s:highlight_groups({
  \ 'CocErrorFloat'  : p.fg.red,
  \ 'CocWarningFloat': p.fg.yellow_alt,
  \ 'CocFloating'    : { 'bg': p.color.fg10, 'fg': p.color.fg95 },
  \
  \ 'CocErrorSign'  : p.fg.red,
  \ 'CocWarningSign': p.fg.yellow_alt,
  \
  \ 'CocHighlightRead' : p.bg.fg15,
  \ 'CocHighlightWrite': p.bg.fg15,
  \ })

" fzf
let g:fzf_colors = {
      \ 'fg': ['fg', 'Normal'],
      \ 'bg': ['bg', 'FZFBackground'],
      \ 'border': ['fg', 'FZFBorder'],
      \ }

call s:h("FZFBackground", p.bg.bg)
call s:h("FZFBorder", p.fg.fg20)

" gitgutter
call s:highlight_groups({
  \ 'GitGutterAdd'             : p.fg.diff_add,
  \ 'GitGutterChange'          : p.fg.diff_change,
  \ 'GitGutterDelete'          : p.fg.diff_delete,
  \ 'GitGutterChangeDeleteLine': p.fg.diff_delete,
  \ })

" lightline
let g:lightline.colorscheme = 'nightowl2'

" vim-highlightedyank
call s:h("HighlightedyankRegion" , p.bg.yellow_alt15)

" hop.nvim
call s:h("HopUnmatched" , p.fg.fg40)

" treesitter
call s:highlight_groups({
  \ 'TSPunctDelimiter': p.fg.magenta,
  \ 'TSPunctBracket'  : p.fg.fg,
  \ 'TSPunctSpecial'  : p.fg.magenta,
  \
  \ 'TSConstant'    : p.fg.italic.orange,
  \ 'TSConstBuiltin': p.fg.red,
  \ 'TSConstMacro'  : p.fg.fg,
  \ 'TSString'      : p.fg.yellow,
  \ 'TSStringRegex' : p.fg.fg,
  \ 'TSStringEscape': p.fg.orange,
  \ 'TSCharacter'   : p.fg.orange,
  \ 'TSNumber'      : p.fg.orange,
  \ 'TSBoolean'     : p.fg.red,
  \ 'TSFloat'       : p.fg.orange,
  \
  \ 'TSFunction'          : p.fg.italic.blue,
  \ 'TSFuncBuiltin'       : p.fg.italic.lime,
  \ 'TSFuncMacro'         : p.fg.magenta,
  \ 'TSParameter'         : p.fg.cyan,
  \ 'TSParameterReference': p.fg.fg,
  \ 'TSMethod'            : p.fg.italic.blue,
  \ 'TSField'             : p.fg.cyan,
  \ 'TSProperty'          : p.fg.cyan,
  \ 'TSConstructor'       : p.fg.blue,
  \ 'TSAnnotation'        : p.fg.magenta,
  \ 'TSAttribute'         : p.fg.magenta,
  \ 'TSNamespace'         : p.fg.fg,
  \ 'TSSymbol'            : p.fg.fg,
  \
  \ 'TSConditional'    : p.fg.magenta,
  \ 'TSRepeat'         : p.fg.magenta,
  \ 'TSLabel'          : p.fg.magenta,
  \ 'TSOperator'       : p.fg.magenta,
  \ 'TSKeyword'        : p.fg.magenta,
  \ 'TSKeywordFunction': p.fg.magenta,
  \ 'TSKeywordOperator': p.fg.magenta,
  \ 'TSException'      : p.fg.magenta,
  \
  \ 'TSType'       : p.fg.magenta,
  \ 'TSTypeBuiltin': p.fg.italic.magenta,
  \ 'TSInclude'    : p.fg.magenta,
  \
  \ 'TSVariableBuiltin': p.fg.magenta,
  \
  \ 'TSText'          : p.fg.fg,
  \ 'TSStrong'        : p.fg.bold.fg,
  \ 'TSEmphasis'      : p.fg.italic.fg,
  \ 'TSUnderline'     : { 'gui': 'underline,italic', 'fg': p.color.lime },
  \ 'TSStrike'        : p.fg.fg,
  \ 'TSMath'          : p.fg.fg,
  \ 'TSTextReference' : p.fg.italic.lime,
  \ 'TSEnviroment'    : p.fg.fg,
  \ 'TSEnviromentName': p.fg.orange,
  \ 'TSTitle'         : p.fg.bold.blue,
  \ 'TSLiteral'       : p.fg.magenta,
  \ 'TSURI'           : p.fg.fg,
  \
  \ 'TSComment': p.fg.italic.fg50,
  \ 'TSNote'   : p.fg.fg,
  \ 'TSWarning': p.fg.fg,
  \ 'TSDanger' : p.fg.fg,
  \
  \ 'TSTag'         : p.fg.blue,
  \ 'TSTagDelimiter': p.fg.blue,
  \ })

" treesitter-rainbow
call s:highlight_groups({
  \ 'rainbowcol1': p.fg.rainbow1,
  \ 'rainbowcol2': p.fg.rainbow2,
  \ 'rainbowcol3': p.fg.rainbow3,
  \ 'rainbowcol4': p.fg.rainbow4,
  \ 'rainbowcol5': p.fg.rainbow5,
  \ 'rainbowcol6': p.fg.rainbow6,
  \ 'rainbowcol7': p.fg.rainbow7,
  \ })

" ShowMotion
call s:h("ShowMotion_CharSearchGroup", { 'fg': 'red', 'gui': 'bold' })
