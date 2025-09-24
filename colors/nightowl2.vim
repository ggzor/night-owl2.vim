if !has('gui_running') && &t_Co < 256
  finish
endif

set background=dark

highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "nightowl2"

function! s:highlight(group, style) abort
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

function! s:link(from, to) abort
  execute "highlight link" a:from a:to
endfunction

function! s:highlight_groups(groups) abort
  for k in keys(a:groups)
    call s:highlight(k, a:groups[k])
  endfor
endfunction

function! s:link_groups(target, groups) abort
  for from in a:groups
    call s:link(from, a:target)
  endfor
endfunction

let p = nightowl2#palette#create()

" Vim UI
call s:highlight_groups({
  \ 'Normal'     : p.fg.fg,
  \ 'EndOfBuffer': p.hidden,
  \ 'NonText'    : p.fg.magenta,
  \
  \ 'CursorLine'  : p.bg.black20,
  \ 'CursorColumn': p.bg.bg,
  \ 'ColorColumn' : p.bg.fg40,
  \ 'CursorLineNr': { 'fg': p.color.fg, 'bg': p.color.fg10 },
  \ 'LineNr'      : p.fg.fg25,
  \ 'MatchParen'  : p.bg.fg20,
  \ 'SignColumn'  : p.hidden,
  \ 'FoldColumn'  : p.hidden,
  \ 'CurSearch'   : p.bg.blue25,
  \ 'Search'      : p.bg.blue25,
  \ 'IncSearch'   : { 'gui': 'bold', 'bg': p.color.blue65 },
  \ 'Title'       : p.fg.bold.blue,
  \ 'VertSplit'   : p.fg.fg5,
  \ 'WinSeparator': p.fg.fg5,
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
  \ 'DiffChange': p.bg.diff_add15,
  \ 'DiffText'  : p.bg.diff_add30,
  \ 'DiffDelete': { 'bg': p.color.bg_dark, 'fg': p.color.bg_dark },
  \
  \ 'DiffOldAdd'   : p.bg.diff_delete15,
  \ 'DiffOldChange': p.bg.diff_delete15,
  \ 'DiffOldText'  : p.bg.diff_delete40,
  \
  \ 'NormalFloat': p.bg.bg_light,
  \
  \ 'Pmenu'     : p.bg.bg_light,
  \ 'PmenuSel'  : p.bg.bg_blue,
  \ 'PmenuSbar' : p.bg.bg_light,
  \ 'PmenuThumb': p.bg.bg_scroll,
  \
  \ 'qfError'    : p.fg.red,
  \ 'qfFileName' : p.fg.lime,
  \ 'qfLineNr'   : p.fg.blue,
  \ 'qfSeparator': p.fg.fg25,
  \
  \ 'WarningMsg': p.fg.bold.yellow_alt,
  \ })


" Old highlighting
call s:highlight_groups({
  \ 'Comment': p.fg.fg50,
  \
  \ 'Constant' : p.fg.red,
  \ 'String'   : p.fg.yellow,
  \ 'Character': p.fg.yellow,
  \ 'Number'   : p.fg.orange,
  \ 'Boolean'  : p.fg.red,
  \ 'Float'    : p.fg.orange,
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
  \ 'Tag'           : p.fg.lime,
  \ 'Delimiter'     : p.fg.fg,
  \ 'SpecialComment': { 'gui': 'bold', 'fg': p.color.magenta, 'bg': p.color.magenta10 },
  \ 'Debug'         : p.fg.fg,
  \
  \ 'Underlined': { 'gui': 'underline', 'fg': p.color.lime },
  \ 'Ignore'    : p.fg.fg,
  \ 'Error'     : p.fg.red,
  \ 'Todo'      : { 'gui': 'bold', 'fg': p.color.magenta, 'bg': p.color.magenta10 },
  \
  \ 'DiagnosticUnderlineError': { 'gui': 'undercurl', 'sp': p.color.red },
  \ 'DiagnosticUnderlineWarn': { 'gui': 'undercurl', 'sp': p.color.yellow_alt },
  \ 'DiagnosticUnderlineInfo': { 'gui': 'undercurl', 'sp': p.color.blue },
  \ 'DiagnosticUnderlineHint': { 'gui': 'undercurl', 'sp': p.color.cyan },
  \ })

" Old highlighting: md
call s:highlight_groups({
  \ 'mkdBlockquote': p.fg.magenta,
  \ })

" Old highlighting: vim
call s:highlight_groups({
  \ 'vimAutoCmdSfxList': p.fg.bold.blue,
  \ 'vimMapLhs'        : p.fg.orange,
  \ 'vimFunction'      : p.fg.blue,
  \ 'vimUserFunc'      : p.fg.blue,
  \ })

" Old highlighting: idris
call s:link_groups('Comment', [
	\	'idrisPragma',
  \ ])

" Old highlighting: agda
call s:highlight_groups({
	\ 'agdaString': p.fg.yellow,
	\ 'agdaConstructor': p.fg.blue,
	\ 'agdaCharCode': p.fg.orange,
	\ 'agdaCharCodeErr': p.fg.red,
	\ 'agdaHole': p.fg.red,
	\ 'agdaDubious': p.fg.fg,
	\ 'agdaFunction': p.fg.blue,
	\ 'agdaOperator': p.fg.cyan,
	\ 'agdaPragma': p.fg.magenta,
	\ 'agdaInfixConstructor': p.fg.blue,
	\ 'agdaInfixFunction': p.fg.magenta,
	\ 'agdaXXX': p.fg.red,
  \ })

call s:link('agdaNumber', 'Number')
call s:link('agdaKeywords', 'Keyword')
call s:link('agdaLineComment', 'Comment')
call s:link('agdaBlockComment', 'Comment')
call s:link('agdaTODO', 'Todo')
call s:link('agdaFIXME', 'Error')

" Plugins highlighting

" coc.nvim
call s:highlight_groups({
  \ 'CocFadeOut'     : p.fg.fg50,
  \ 'CocErrorFloat'  : { 'bg': p.color.fg10, 'fg': p.color.red },
  \ 'CocWarningFloat': { 'fg': p.color.yellow_alt },
  \ 'CocInfoFloat': { 'fg': p.color.blue },
  \ 'CocHoverFloat'  : { 'bg': p.color.fg10, 'fg': p.color.fg95 },
  \ 'CocFloatDividingLine': p.fg.bg_light95fg,
  \ 'CocPumSearch': p.fg.bold.fg,
  \ 'CocFloatSbar' : p.bg.bg_light,
  \ 'CocFloatThumb': p.bg.bg_scroll,
  \ 'CocFloatActive': p.bg.bg_light90fg,
  \
  \ 'CocErrorSign'  : p.fg.red,
  \ 'CocHintSign'  : p.fg.cyan,
  \ 'CocWarningSign': p.fg.yellow_alt,
  \
  \ 'CocInlayHint'     : p.fg.fg60,
  \ 'CocRustTypeHint'  : p.fg.fg60,
  \
  \ 'CocHighlightRead' : p.bg.fg15,
  \ 'CocHighlightWrite': p.bg.fg15,
  \
  \ 'CocMarkdownHeader': p.fg.blue,
  \ 'CocMarkdownLink': p.fg.blue,
  \
  \ 'CocSymbolClass': p.fg.yellow,
  \ 'CocSymbolFunction': p.fg.magenta,
  \ 'CocSymbolKeyword': p.fg.fg80,
  \ 'CocSymbolModule': p.fg.fg80,
  \ })

" fzf
let g:fzf_colors = {
      \ 'fg': ['fg', 'Normal'],
      \ 'bg': ['bg', 'FZFBackground'],
      \ 'gutter': ['bg', 'FZFBackground'],
      \ 'border': ['fg', 'FZFBorder'],
      \ }

call s:highlight("FZFBackground", p.bg.bg)
call s:highlight("FZFBorder", p.fg.fg20)

" indentLine color
let g:indentLine_color_gui = p.color.fg15
" indentmin.nvim
call s:highlight("IndentLine", p.fg.fg15)
call s:highlight("IndentLineCurrent", p.fg.fg35)

" vim-fugitive
call s:highlight_groups({
  \ 'gitcommitOverflow': p.fg.red,
  \ 'gitcommitSelectedFile' : p.fg.lime,
  \ 'gitcommitDiscardedFile' : p.fg.yellow,
  \ 'gitcommitUntrackedFile' : p.fg.fg,
  \ 'gitcommitSummary' : p.fg.fg,
  \ })

" Make diff signs have the right color
highlight! link @punctuation.special.diff NONE

" gitgutter
call s:highlight_groups({
  \ 'GitGutterAdd'             : p.fg.diff_add,
  \ 'GitGutterChange'          : p.fg.diff_change,
  \ 'GitGutterDelete'          : p.fg.diff_delete,
  \ 'GitGutterChangeDeleteLine': p.fg.diff_delete,
  \ })

" lightline
if exists('g:lightline')
  let g:lightline.colorscheme = 'nightowl2'
end

" vim-highlightedyank
call s:highlight("HighlightedyankRegion" , p.bg.yellow_alt15)

" hop.nvim
call s:highlight("HopUnmatched" , p.fg.fg40)

" treesitter
call s:highlight_groups({
  \ '@annotation': p.fg.magenta,
  \ '@attribute': p.fg.magenta,
  \ '@boolean': p.fg.red,
  \ '@character': p.fg.orange,
  \ '@comment': p.fg.fg50,
  \ '@comment.error': { 'gui': 'bold', 'fg': p.color.red, 'bg': p.color.red10 },
  \ '@comment.warning': { 'gui': 'bold', 'fg': p.color.yellow_alt, 'bg': p.color.yellow_alt10 },
  \ '@comment.note': { 'gui': 'bold', 'fg': p.color.magenta, 'bg': p.color.magenta10 },
  \ '@conditional': p.fg.magenta,
  \ '@constant': p.fg.blue60fg,
  \ '@constant.builtin': p.fg.red,
  \ '@constant.macro': p.fg.magenta,
  \ '@constructor': p.fg.magenta,
  \ '@exception': p.fg.magenta,
  \ '@field': p.fg.fg,
  \ '@float': p.fg.orange,
  \ '@function': p.fg.blue,
  \ '@function.builtin': p.fg.lime,
  \ '@function.macro': p.fg.magenta,
  \ '@include': p.fg.magenta,
  \ '@keyword': p.fg.magenta,
  \ '@keyword.function': p.fg.magenta,
  \ '@keyword.operator': p.fg.magenta,
  \ '@label': p.fg.magenta,
  \ '@method': p.fg.blue,
  \ '@namespace': p.fg.fg,
  \ '@number': p.fg.orange,
  \ '@operator': p.fg.magenta,
  \ '@parameter': p.fg.cyan,
  \ '@parameter.reference': p.fg.fg,
  \ '@property': p.fg.fg,
  \ '@property.json': p.fg.cyan,
  \ '@property.jsonc': p.fg.cyan,
  \ '@punctuation.bracket': p.fg.fg,
  \ '@punctuation.delimiter': p.fg.magenta,
  \ '@punctuation.hidden': p.fg.fg50,
  \ '@punctuation.special': p.fg.magenta,
  \ '@repeat': p.fg.magenta,
  \ '@string': p.fg.yellow,
  \ '@string.escape': p.fg.orange,
  \ '@string.regex': p.fg.fg,
  \ '@symbol': p.fg.fg,
  \ '@tag': p.fg.blue,
  \ '@tag.attribute': p.fg.lime,
  \ '@tag.delimiter': p.fg.blue,
  \ '@text': p.fg.fg,
  \ '@text.danger': p.fg.bold.red,
  \ '@text.emphasis': { 'gui': 'italic', 'fg': p.color.fg },
  \ '@text.enviroment': p.fg.fg,
  \ '@text.enviroment.name': p.fg.orange,
  \ '@text.literal': p.fg.magenta,
  \ '@text.math': p.fg.fg,
  \ '@text.note': p.fg.bold.blue,
  \ '@text.quote': p.fg.magenta,
  \ '@text.reference': { 'gui': 'underline', 'fg': p.color.lime },
  \ '@text.strike': p.fg.fg,
  \ '@text.strong': p.fg.bold.fg,
  \ '@text.title': p.fg.bold.blue,
  \ '@text.underline': { 'gui': 'underline', 'fg': p.color.lime },
  \ '@text.uri': { 'gui': 'underline', 'fg': p.color.lime },
  \ '@text.warning': p.fg.bold.yellow_alt,
  \ '@type': p.fg.magenta65fg,
  \ '@type.builtin': p.fg.magenta,
  \ '@variable': p.fg.fg,
  \ '@variable.builtin': p.fg.magenta,
  \ })

"" Specific languages

""" CSS
call s:highlight_groups({
  \ '@function.css': p.fg.lime,
  \ '@property.css': p.fg.cyan,
  \ '@variable.selector.class': p.fg.lime,
  \ '@variable.selector.id': p.fg.yellow,
  \ })

""" Markdown
call s:highlight_groups({
  \ '@conceal.markdown_inline': p.fg.fg50,
  \ '@conceal.markdown': p.fg.fg50,
  \ '@label.markdown': p.fg.fg50,
  \ '@markup.heading': p.fg.bold.blue,
  \ '@markup.italic': { 'gui': 'italic', 'fg': p.color.fg },
  \ '@markup.link': { 'gui': 'underline', 'fg': p.color.lime },
  \ '@markup.list': p.fg.cyan,
  \ '@markup.raw': p.fg.yellow,
  \ '@markup.raw.block': p.fg.fg,
  \ '@markup.strong': p.fg.bold.fg,
  \ })

""" Nix
call s:highlight_groups({
  \ '@variable.parameter.builtin.nix': p.fg.magenta,
  \ })

""" YAML
call s:highlight_groups({
  \ '@field.yaml': p.fg.magenta,
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
call s:highlight("ShowMotion_CharSearchGroup", { 'fg': 'red', 'gui': 'bold' })

" luochen1990/rainbow
let g:rainbow_conf = extend(get(g:, 'rainbow_conf', {}), {
  \   'guifgs': [
  \     p.color.rainbow1,
  \     p.color.rainbow2,
  \     p.color.rainbow3,
  \     p.color.rainbow4,
  \     p.color.rainbow5,
  \     p.color.rainbow6,
  \     p.color.rainbow7,
  \   ],
  \ })

" vim-visual-cursors

" VM_Extend for extend
" MultiCursor for cursor
call s:highlight_groups({
  \ 'VM_Mono': { 'fg': p.color.white, 'bg': p.color.cursor },
  \ 'VM_Cursor': { 'fg': p.color.white, 'bg': p.color.cursor },
  \ 'VM_Insert': { 'fg': p.color.white, 'bg': p.color.cursor30 },
  \ })
call s:link('VM_Extend', 'Visual')
