" ========================
" ColdWinter (Enhanced + Rounded)
" ========================

" Enable Powerline / Nerd Font symbols
let g:airline_powerline_fonts = 1

" Optional: match padding so edges don't clip

" ========================
" Palette definition
" ========================

" Normal Mode – Balanced cold gray, default calm tone
let s:N1 = [ '#a8b0ba', '#101214', 250, 235 ]
let s:N2 = [ '#8d949c', '#1e2328', 246, 236 ]
let s:N3 = [ '#70777f', '#0c0e11', 243, 234 ]

" Insert Mode – Brighter ice-gray, for clarity during typing
let s:I1 = [ '#0d0e0f', '#b8c4d1', 232, 252 ]
let s:I2 = [ '#97a1ad', '#16181c', 247, 235 ]
let s:I3 = s:N3

" Visual Mode – Muted steel-blue for selection
let s:V1 = [ '#0d0e0f', '#93a8c4', 232, 110 ]
let s:V2 = [ '#87909b', '#121418', 245, 234 ]
let s:V3 = s:N3

" Command Mode – Frosted bright tone for attention
let s:C1 = [ '#0d0e0f', '#c9d5e2', 232, 189 ]
let s:C2 = [ '#9ba3ad', '#1a1d22', 247, 235 ]
let s:C3 = [ '#7a8189', '#0d1014', 243, 234 ]

" Replace Mode – Deeper steel-gray with slight blue edge
let s:R1 = [ '#0d0e0f', '#8fa0b2', 232, 110 ]
let s:R2 = [ '#828b96', '#202429', 245, 236 ]
let s:R3 = s:N3

" Inactive Mode – Dim cool tone for background
let s:IA = [ '#4a5057', s:N3[1], 239, s:N3[3] ]

" Warning Mode – Muted icy amber, still cold
let s:WI = [ '#0d0e0f', '#101214', 232, 179 ]

" Error Mode – Cold desaturated red-violet tint
let s:ER = [ '#0d0e0f', '#4a5057', 232, 132 ]

" Terminal Mode
let s:TE = [ s:WI[0], s:N1[1], s:N1[2], s:N1[3] ]

" Reverse Mode
let s:NR = [ s:N2[1], s:N2[0], s:N2[3], s:N2[2], 'bold' ]

" ========================
" Palette registration
" ========================

let g:airline#themes#coldWinter#palette = {}
let g:airline#themes#coldWinter#palette.normal   = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#coldWinter#palette.insert   = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#coldWinter#palette.visual   = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#coldWinter#palette.commandline = airline#themes#generate_color_map(s:C1, s:C2, s:C3)
let g:airline#themes#coldWinter#palette.replace  = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#coldWinter#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

" Indicators
let g:airline#themes#coldWinter#palette.normal.airline_warning  = s:WI
let g:airline#themes#coldWinter#palette.normal.airline_error    = s:ER
let g:airline#themes#coldWinter#palette.normal.airline_term     = s:TE
let g:airline#themes#coldWinter#palette.insert.airline_warning  = s:WI
let g:airline#themes#coldWinter#palette.insert.airline_error    = s:ER
let g:airline#themes#coldWinter#palette.visual.airline_warning  = s:WI
let g:airline#themes#coldWinter#palette.visual.airline_error    = s:ER
let g:airline#themes#coldWinter#palette.commandline.airline_warning = s:WI
let g:airline#themes#coldWinter#palette.commandline.airline_error   = s:ER
let g:airline#themes#coldWinter#palette.replace.airline_warning = s:WI
let g:airline#themes#coldWinter#palette.replace.airline_error   = s:ER

" Accents
let g:airline#themes#coldWinter#palette.accents = { 'red': [ s:ER[1], '', s:ER[3], '' ] }

" CtrlP
if get(g:, 'loaded_ctrlp', 0)
    let g:airline#themes#coldWinter#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(s:N3, s:N2, s:NR)
endif
