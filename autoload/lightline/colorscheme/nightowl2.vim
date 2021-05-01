let s:save_cpo = &cpo
set cpo&vim

function! s:build_palette() abort
  let p = nightowl2#palette#create()

  let r = {
        \ 'normal'  : {},
        \ 'inactive': {},
        \ 'insert'  : {},
        \ 'replace' : {},
        \ 'visual'  : {},
        \ 'tabline' : {},
        \ }

  let r.normal.middle = [[p.color.bg_dark, p.color.bg_dark, 1, 1]]

  let r.normal.left   = s:default_segment(p, p.color.blue)
  let r.normal.right  = r.normal.left

  let r.insert.left   = s:default_segment(p, p.color.lime)
  let r.insert.right  = r.insert.left

  let r.replace.left  = s:default_segment(p, p.color.red)
  let r.replace.right = r.replace.left

  let r.visual.left   = s:default_segment(p, p.color.magenta)
  let r.visual.right  = r.visual.left

  let r.inactive.left  = [
        \ [p.color.fg60, p.color.bg_dark, 1, 1],
        \ [p.color.fg60, p.color.bg_dark, 1, 1]]
  let r.inactive.right = r.inactive.left

  let r.tabline.left   = [[p.color.fg, p.color.fg5, 1, 1]]
  let r.tabline.middle = [[p.color.fg5, p.color.fg5, 1, 1]]
  let r.tabline.tabsel = [[p.color.bg_dark, p.color.blue, 1, 1]]

  return r
endfunction

function! s:default_segment(p, color) abort
  return [
        \ [a:p.color.bg_dark, a:color, 1, 1],
        \ [a:p.color.fg90, a:p.color.bg_dark, 1, 1]]
endfunction

let g:lightline#colorscheme#nightowl2#palette = s:build_palette()

let &cpo = s:save_cpo
unlet s:save_cpo
