" Author: Huang Po-Hsuan <https://github.com/aben20807>
" Filename: stealth.vim
" Last Modified: 2018-10-21 19:59:41
" Vim: enc=utf-8
" Enhanced by Claude for better contrast - Dark version (2026)

" stealth palette
" inspired by murmur and fresh
" Enhanced with improved contrast while maintaining dark theme

let g:airline#themes#stealth#palette = {}

" Color palette - Enhanced dark contrast version
let s:cterm_termbg    = 238         " Background for branch and file format blocks
let s:gui_termbg      = '#121212'
let s:cterm_termfg    = 255         " Foreground for branch and file format blocks (bright white)
let s:gui_termfg      = '#ffffff'

let s:cterm_termbg2   = 233         " Background for middle block (very dark)
let s:gui_termbg2     = '#202020'
let s:cterm_termfg2   = 248         " Foreground for middle block (bright gray)
let s:gui_termfg2     = '#a8a8a8'

let s:cterm_normalbg  = 240         " Background for normal mode (slightly lighter for contrast)
let s:gui_normalbg    = '#1c1c1c'
let s:cterm_normalfg  = 255         " Foreground for normal mode (bright white)
let s:gui_normalfg    = '#ffffff'

let s:cterm_insertbg  = 236         " Background for insert mode (dark gray)
let s:gui_insertbg    = '#303030'
let s:cterm_insertfg  = 255         " Foreground for insert mode (bright white)
let s:gui_insertfg    = '#ffffff'

let s:cterm_visualbg  = 234         " Background for visual mode (very dark)
let s:gui_visualbg    = '#585858'
let s:cterm_visualfg  = 252         " Foreground for visual mode (light gray)
let s:gui_visualfg    = '#d0d0d0'

let s:cterm_replacebg = 235         " Background for replace mode (dark)
let s:gui_replacebg   = '#262626'
let s:cterm_replacefg = 255         " Foreground for replace mode (bright white)
let s:gui_replacefg   = '#ffffff'

let s:cterm_alert     = 254         " Modified file alert color (very bright gray)
let s:gui_alert       = '#e4e4e4'

let s:cterm_warningbg = 237         " Background for warning blocks (dark)
let s:gui_warningbg   = '#3a3a3a'
let s:cterm_warningfg = 220         " Foreground for warning blocks (bright yellow-gray)
let s:gui_warningfg   = '#ffffff'

let s:cterm_errorbg   = 234         " Background for error blocks (very dark)
let s:gui_errorbg     = '#1c1c1c'
let s:cterm_errorfg   = 255         " Foreground for error blocks (bright white)
let s:gui_errorfg     = '#ffffff'

let s:cterm_inactivebg = 233        " Background for inactive mode (very dark)
let s:gui_inactivebg   = '#121212'
let s:cterm_inactivefg = 240        " Foreground for inactive mode (medium gray)
let s:gui_inactivefg   = '#585858'

" Branch and file format
let s:BB = [s:gui_termfg, s:gui_termbg, s:cterm_termfg, s:cterm_termbg]

" Warning and error format
let s:W = [s:gui_warningfg, s:gui_warningbg, s:cterm_warningfg, s:cterm_warningbg, 'bold']
let s:E = [s:gui_errorfg, s:gui_errorbg, s:cterm_errorfg, s:cterm_errorbg, 'bold']

" NORMAL mode
" Outside blocks in normal mode
let s:N1 = [s:gui_normalfg, s:gui_normalbg, s:cterm_normalfg, s:cterm_normalbg]
let s:N2 = s:BB
" Middle block
let s:N3 = [s:gui_termfg2, s:gui_termbg2, s:cterm_termfg2, s:cterm_termbg2]
let g:airline#themes#stealth#palette.normal =
    \ airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#stealth#palette.normal.airline_warning = s:W
let g:airline#themes#stealth#palette.normal.airline_error = s:E
let g:airline#themes#stealth#palette.normal_modified = {
    \ 'airline_c': [s:gui_alert, s:gui_termbg2, s:cterm_alert, s:cterm_termbg2, 'bold'],
    \ 'airline_warning': s:W,
    \ 'airline_error': s:E
    \ }

" INSERT mode
" Outside blocks in insert mode
let s:I1 = [s:gui_insertfg, s:gui_insertbg, s:cterm_insertfg, s:cterm_insertbg]
let s:I2 = s:BB
" Middle block
let s:I3 = [s:gui_termfg2, s:gui_termbg2, s:cterm_termfg2, s:cterm_termbg2]
let g:airline#themes#stealth#palette.insert =
    \ airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#stealth#palette.insert.airline_warning = s:W
let g:airline#themes#stealth#palette.insert.airline_error = s:E
let g:airline#themes#stealth#palette.insert_modified =
    \ g:airline#themes#stealth#palette.normal_modified

" REPLACE mode
" Outside blocks in replace mode
let s:R1 = [s:gui_replacefg, s:gui_replacebg, s:cterm_replacefg, s:cterm_replacebg]
let s:R2 = s:BB
" Middle block
let s:R3 = [s:gui_termfg2, s:gui_termbg2, s:cterm_termfg2, s:cterm_termbg2]
let g:airline#themes#stealth#palette.replace =
    \ airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#stealth#palette.replace.airline_warning = s:W
let g:airline#themes#stealth#palette.replace.airline_error = s:E
let g:airline#themes#stealth#palette.replace_modified =
    \ g:airline#themes#stealth#palette.normal_modified

" VISUAL mode
" Outside blocks in visual mode
let s:V1 = [s:gui_visualfg, s:gui_visualbg, s:cterm_visualfg, s:cterm_visualbg]
let s:V2 = s:BB
" Middle block
let s:V3 = [s:gui_termfg2, s:gui_termbg2, s:cterm_termfg2, s:cterm_termbg2]
let g:airline#themes#stealth#palette.visual =
    \ airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#stealth#palette.visual.airline_warning = s:W
let g:airline#themes#stealth#palette.visual.airline_error = s:E
let g:airline#themes#stealth#palette.visual_modified =
    \ g:airline#themes#stealth#palette.normal_modified

" INACTIVE mode
let s:IA1 = [s:gui_inactivefg, s:gui_inactivebg, s:cterm_inactivefg, s:cterm_inactivebg, '']
let s:IA2 = [s:gui_inactivefg, s:gui_inactivebg, s:cterm_inactivefg, s:cterm_inactivebg, '']
let s:IA3 = [s:gui_inactivefg, s:gui_inactivebg, s:cterm_inactivefg, s:cterm_inactivebg, '']
let g:airline#themes#stealth#palette.inactive =
    \ airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#stealth#palette.inactive.airline_warning = s:IA2
let g:airline#themes#stealth#palette.inactive.airline_error =  s:IA2
let g:airline#themes#stealth#palette.inactive_modified =
    \ g:airline#themes#stealth#palette.normal_modified

let g:airline#themes#stealth#palette.accents = {
    \ 'red': [ '#ffffff' , '' , 255 , ''  ]
    \ }
