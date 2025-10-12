" Minimalist Airline - Full Grayscale Theme
"
" Author:       Diki Ananta <diki1aap@gmail.com>
" Modified:     Full grayscale theme with distinct mode shades
" Repository:   https://github.com/dikiaap/minimalist
" Version:      1.6
" License:      MIT

" Normal Mode - Subtle medium gray
let s:N1 = [ '#9da3aa', '#262626', 248, 235 ]
let s:N2 = [ '#7a8088', '#3a3a3a', 244, 237 ]
let s:N3 = [ '#6a7179', '#1a1a1a', 242, 234 ]

" Insert Mode - Brighter for active editing
let s:I1 = [ '#0d0e0f', '#9da3aa', 232, 248 ]
let s:I2 = [ '#7a8088', '#3a3a3a', 244, 237 ]
let s:I3 = s:N3

" Visual Mode - Mid-tone gray
let s:V1 = [ '#0d0e0f', '#858c93', 232, 246 ]
let s:V2 = [ '#7a8088', '#3a3a3a', 244, 237 ]
let s:V3 = s:N3

" Command Mode - Brightest for commands
let s:C1 = [ '#0d0e0f', '#b5bec9', 232, 249 ]
let s:C2 = [ '#7a8088', '#3a3a3a', 244, 237 ]
let s:C3 = [ '#6a7179', '#1a1a1a', 242, 234 ]

" Replace Mode - Slightly darker
let s:R1 = [ '#0d0e0f', '#7d848c', 232, 245 ]
let s:R2 = [ '#7a8088', '#3a3a3a', 244, 237 ]
let s:R3 = s:N3

" Inactive Mode - Very dim
let s:IA = [ '#4a4f55', s:N3[1], 239, s:N3[3] ]

" Warning Mode - Noticeable but subtle
let s:WI = [ '#0d0e0f', '#8a9099', 232, 247 ]

" Error Mode - Subdued red tint
let s:ER = [ '#0d0e0f', '#ffffff', 232, 131 ]

" Terminal Mode
let s:TE = [ s:WI[0], s:N1[1], s:N1[2], s:N1[3] ]

" Reverse Mode
let s:NR = [ s:N2[1], s:N2[0], s:N2[3], s:N2[2], 'bold' ]

let g:airline#themes#minimalist_gray#palette = {}

" Generate mode-specific palettes
let g:airline#themes#minimalist_gray#palette.normal   = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#minimalist_gray#palette.insert   = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#minimalist_gray#palette.visual   = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#minimalist_gray#palette.commandline = airline#themes#generate_color_map(s:C1, s:C2, s:C3)
let g:airline#themes#minimalist_gray#palette.replace  = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#minimalist_gray#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

" Status indicators for all modes
let g:airline#themes#minimalist_gray#palette.normal.airline_warning  = s:WI
let g:airline#themes#minimalist_gray#palette.normal.airline_error    = s:ER
let g:airline#themes#minimalist_gray#palette.normal.airline_term     = s:TE
let g:airline#themes#minimalist_gray#palette.insert.airline_warning  = s:WI
let g:airline#themes#minimalist_gray#palette.insert.airline_error    = s:ER
let g:airline#themes#minimalist_gray#palette.visual.airline_warning  = s:WI
let g:airline#themes#minimalist_gray#palette.visual.airline_error    = s:ER
let g:airline#themes#minimalist_gray#palette.commandline.airline_warning = s:WI
let g:airline#themes#minimalist_gray#palette.commandline.airline_error   = s:ER
let g:airline#themes#minimalist_gray#palette.replace.airline_warning = s:WI
let g:airline#themes#minimalist_gray#palette.replace.airline_error   = s:ER

" Accents
let g:airline#themes#minimalist_gray#palette.accents = { 'red': [ s:ER[1], '', s:ER[3], '' ] }

" CtrlP
if get(g:, 'loaded_ctrlp', 0)
    let g:airline#themes#minimalist_gray#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(s:N3, s:N2, s:NR)
endif
