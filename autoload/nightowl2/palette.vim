let s:cache_file = expand('<sfile>:r')..'.json'

function! nightowl2#palette#create() abort
  if filereadable(s:cache_file)
    let g:__nightowl2_palette_cache = json_decode(readfile(s:cache_file))
  endif

  if exists('g:__nightowl2_palette_cache')
    return g:__nightowl2_palette_cache
  endif

  let p = {}
  let g:__nightowl2_palette_cache = p

  " Colors
  let p.color = { }

  let p.color.bg = '#011627'
  let p.color.fg = '#d6deeb'

  let p.color.black     = '#536372'
  let p.color.red       = '#ef5350'
  let p.color.green     = '#22da6e'
  let p.color.yellow    = '#ecc48d'
  let p.color.blue      = '#82aaff'
  let p.color.magenta   = '#c792ea'
  let p.color.cyan      = '#7fdbca'
  let p.color.white     = '#ffffff'
  let p.color.orange    = '#f78c6c'
  let p.color.lime      = '#9ccc65'
  let p.color.yellow_alt = '#e2b93d'

  let p.color.bg_dark   = '#00121f'
  let p.color.bg_light  = '#2c3043'
  let p.color.bg_blue   = '#5f7e97'
  let p.color.bg_scroll = '#084d81'

  " Diff colors
  let p.color.diff_add    = p.color.lime
  let p.color.diff_change = p.color.yellow_alt
  let p.color.diff_delete = p.color.red

  " Rainbow colors for rainbow-parentheses
  let p.color.rainbow1 = '#c792ea'
  let p.color.rainbow2 = '#adc7ff'
  let p.color.rainbow3 = '#f75590'
  let p.color.rainbow4 = '#f49190'
  let p.color.rainbow5 = '#badb94'
  let p.color.rainbow6 = '#f3dbb9'
  let p.color.rainbow7 = '#979287'

  " Generate 'transparent' colors for foreground
  let bg_rgb = s:hex2rgb(p.color.bg)
  let fg_rgb = s:hex2rgb(p.color.fg)

  let colors = copy(keys(p.color))
  for color in colors
    if color !~# "bg"
      for amount in range(25, 75, 25) + range(5, 95, 5)
          let color_rgb = s:hex2rgb(p.color[color])

          let p.color[color..amount] =
                \ s:rgb2hex(s:linear_interp(amount / 100.0, bg_rgb, color_rgb))
          let p.color[color..amount..'fg'] =
                \ s:rgb2hex(s:linear_interp(amount / 100.0, fg_rgb, color_rgb))
      endfor
    endif
  endfor

  " Generate styles based in colors
  let p.fg = {}
  let p.fg.bold = {}
  let p.fg.italic = {}
  let p.bg = {}

  for color in keys(p.color)
    let p.fg[color]        = { 'fg': p.color[color] }
    let p.fg.bold[color]   = { 'gui': 'bold'         , 'fg': p.color[color] }
    let p.fg.italic[color] = { 'gui': 'italic'       , 'fg': p.color[color] }
    let p.bg[color]        = { 'bg': p.color[color] }
  endfor

  " Extra backgrounds
  let p.hidden = { 'fg': p.color.bg, 'bg': p.color.bg }

  return p
endfunction

function! nightowl2#palette#dump(target) abort
  exec "redir! > "..a:target
  silent exec "echo json_encode(nightowl2#palette#create())"
  redir END
endfunction

function! s:hex2rgb(hex) abort
  return [
        \ str2nr(a:hex[1:2], 16),
        \ str2nr(a:hex[3:4], 16),
        \ str2nr(a:hex[5:6], 16)]
endfunction

function! s:rgb2hex(rgb) abort
  return printf('#%02x%02x%02x', a:rgb[0], a:rgb[1], a:rgb[2])
endfunction

function! s:linear_interp(p, c1, c2) abort
  let result = []
  for i in range(3)
    call add(result,
          \ s:clamp(0, 255, float2nr(a:c1[i] + a:p * (a:c2[i] - a:c1[i]))))
  endfor

  return result
endfunction

function! s:clamp(start, end, value) abort
  return max([a:start, min([a:value, a:end])])
endfunction
