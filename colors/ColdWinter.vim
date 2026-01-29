" Maintainer: Nomix18 

" Reset all highlighting to start fresh
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "ColdWinter"
set background=dark

" ============================================================================
" COLOR PALETTE - DARK BACKGROUNDS WITH NORDIC BLUE ACCENTS
" ============================================================================
" Define all colors in one place for easy modification

" Background & UI Colors (very dark)
let s:bg = {
  \ 'primary':      '#040507',
  \ 'highlight':    '#111213',
  \ 'subtle':       '#161718',
  \ 'selection':    '#2d3439',
  \ 'active_tab':   '#040507',
  \ 'tab':          '#0d1016',
  \ }

" Nordic Blue Palette (calm, muted blues)
let s:nordic = {
  \ 'ice':          '#c8d5e0',
  \ 'frost':        '#a8bcc9',
  \ 'sky':          '#8fa9bb',
  \ 'ocean':        '#7a98ad',
  \ 'deep':         '#6688a0',
  \ 'midnight':     '#5d7a92',
  \ 'steel':        '#556b7f',
  \ 'shadow':       '#4a5c6d',
  \ }

" Foreground & Text Colors (with blue tints)
let s:fg = {
  \ 'brightest':    '#d0d8e0',
  \ 'bright':       '#bfc8d2',
  \ 'normal':       '#9ca8b5',
  \ 'dim':          '#8a96a3',
  \ 'dimmer':       '#788592',
  \ 'dimmest':      '#687480',
  \ }

" Syntax Element Colors (Nordic-inspired)
let s:syntax = {
  \ 'keyword':      '#a8bcc9',
  \ 'constant':     '#8fa9bb',
  \ 'number':       '#7a98ad',
  \ 'type':         '#6688a0',
  \ 'function':     '#9ca8b5',
  \ 'string':       '#91a6b8',
  \ 'variable':     '#889aac',
  \ 'parameter':    '#7d92a6',
  \ 'comment':      '#4a5c6d',
  \ }

" Special Purpose Colors
let s:special = {
  \ 'punctuation':       '#687480',
  \ 'punct_special':     '#788592',
  \ 'tag':              '#556b7f',
  \ 'tag_attr':         '#7a98ad',
  \ 'library_func':     '#8fa9bb',
  \ 'library_const':    '#7a98ad',
  \ 'class_name':       '#a8bcc9',
  \ 'storage':          '#a8bcc9',
  \ }

" UI Element Colors
let s:ui = {
  \ 'cursor':           '#ffffff',
  \ 'white':            '#ffffff',
  \ 'line_number':      '#4a5c6d',
  \ 'indent_guide':     '#1a1d20',
  \ 'notify':           '#2f373f',
  \ 'error':            '#d89090',
  \ 'error_bg':         '#8a6868',
  \ 'warning':          '#d0b080',
  \ }

" Diff Colors (with blue tints)
let s:diff = {
  \ 'deleted':      '#c87c7a',
  \ 'inserted':     '#6a95a5',
  \ 'changed':      '#7a98ad',
  \ }

" ============================================================================
" HELPER FUNCTIONS
" ============================================================================

function! s:hi(group, fg, bg, attr)
  let l:cmd = 'hi! ' . a:group
  if a:fg != ''
    let l:cmd .= ' guifg=' . a:fg
  endif
  if a:bg != ''
    let l:cmd .= ' guibg=' . a:bg
  endif
  if a:attr != ''
    let l:cmd .= ' gui=' . a:attr
  else
    let l:cmd .= ' gui=NONE'
  endif
  execute l:cmd
endfunction

" ============================================================================
" EDITOR UI
" ============================================================================

call s:hi('Normal',        s:fg.normal,      s:bg.primary,     '')
call s:hi('Cursor',        s:bg.primary,     s:ui.cursor,      '')
call s:hi('CursorLine',    '',               s:bg.highlight,   '')
call s:hi('LineNr',        s:ui.line_number, s:bg.primary,     '')
call s:hi('CursorLineNr',  s:nordic.frost,   s:bg.highlight,   'bold')
call s:hi('Visual',        s:ui.white,       s:bg.selection,   '')
call s:hi('VertSplit',     s:ui.indent_guide, s:ui.indent_guide, '')
call s:hi('MatchParen',    s:nordic.ice,     s:nordic.shadow,  'bold')
call s:hi('StatusLine',    s:nordic.frost,   s:bg.highlight,   '')
call s:hi('StatusLineNC',  s:fg.dimmer,      s:bg.subtle,      '')
call s:hi('Pmenu',         s:fg.normal,      s:bg.subtle,      '')
call s:hi('PmenuSel',      s:bg.primary,     s:nordic.sky,     'bold')
call s:hi('Search',        s:bg.primary,     s:nordic.ocean,   '')
call s:hi('IncSearch',     s:bg.primary,     s:nordic.frost,   'bold')
call s:hi('ColorColumn',   '',               s:bg.highlight,   '')
call s:hi('SignColumn',    s:fg.normal,      s:bg.primary,     '')
call s:hi('Folded',        s:syntax.comment, s:bg.subtle,      '')
call s:hi('FoldColumn',    s:syntax.comment, s:bg.primary,     '')
call s:hi('NonText',       s:ui.indent_guide, '',              '')
call s:hi('SpecialKey',    s:ui.indent_guide, '',              '')
call s:hi('Title',         s:nordic.ice,     '',               'bold')
call s:hi('ModeMsg',       s:nordic.sky,     'NONE',           '')
call s:hi('ErrorMsg',      s:ui.error,       'NONE',           'bold')
call s:hi('WarningMsg',    s:ui.warning,     'NONE',           '')

" Diff highlighting
call s:hi('DiffAdd',       '',               '#6a95a522',      '')
call s:hi('DiffDelete',    s:diff.deleted,   s:bg.primary,     '')
call s:hi('DiffChange',    '',               '#7a98ad22',      '')
call s:hi('DiffText',      '',               '#7a98ad44',      'bold')

" ============================================================================
" CORE SYNTAX
" ============================================================================

call s:hi('Comment',       s:syntax.comment,  '',               'italic')
call s:hi('String',        s:syntax.string,   '',               '')
call s:hi('Number',        s:syntax.number,   '',               '')
call s:hi('Constant',      s:syntax.constant, '',               '')
call s:hi('Keyword',       s:syntax.keyword,  '',               'bold')
call s:hi('Statement',     s:syntax.keyword,  '',               'bold')
call s:hi('PreProc',       s:special.storage, '',               '')
call s:hi('Type',          s:syntax.type,     '',               '')
call s:hi('Structure',     s:syntax.type,     '',               'bold')
call s:hi('Special',       s:special.library_func, '',          '')
call s:hi('Underlined',    s:nordic.sky,      '',               'underline')
call s:hi('Error',         s:ui.error,        'NONE',           '')
call s:hi('Todo',          s:nordic.ice,      s:bg.subtle,      'bold')
call s:hi('Identifier',    s:syntax.variable, '',               '')
call s:hi('Function',      s:syntax.function, '',               '')

" ============================================================================
" LSP & TREESITTER
" ============================================================================

call s:hi('@lsp.type.variable',  s:syntax.variable,  '',  '')
call s:hi('@variable',           s:syntax.variable,  '',  '')
call s:hi('@lsp.type.parameter', s:syntax.parameter, '',  '')
call s:hi('@lsp.type.function',  s:syntax.function,  '',  '')
call s:hi('@lsp.type.method',    s:syntax.function,  '',  '')
call s:hi('@lsp.type.class',     s:special.class_name, '', 'bold')
call s:hi('@lsp.type.namespace', s:nordic.ocean,     '',  '')
call s:hi('@lsp.type.keyword',   s:syntax.keyword,   '',  'bold')
call s:hi('@lsp.type.macro',     s:special.storage,  '',  '')
call s:hi('@lsp.type.interface', s:nordic.sky,       '',  'bold')
call s:hi('@lsp.type.enum',      s:syntax.constant,  '',  'bold')

" ============================================================================
" PUNCTUATION
" ============================================================================

call s:hi('Delimiter',           s:special.punctuation,  '',  '')
call s:hi('SpecialChar',         s:special.punct_special, '', '')
call s:hi('Quote',               s:special.punctuation,  '',  '')
call s:hi('Operator',            s:special.punct_special, '', '')
call s:hi('Conceal',             s:special.punctuation,  '',  '')
call s:hi('@lsp.type.operator',  s:special.punct_special, '', '')
call s:hi('@operator',           s:special.punct_special, '', '')

" Custom punctuation groups
call s:hi('StealthPunctuation',        s:special.punctuation,   '',  '')
call s:hi('StealthPunctuationList',    s:special.punct_special, '',  '')
call s:hi('StealthPunctuationAngle',   s:special.punct_special, '',  '')
call s:hi('StealthPunctuationSep',     s:special.punct_special, '',  '')
call s:hi('StealthPunctuationTerm',    s:special.punct_special, '',  '')
call s:hi('StealthPunctuationAccess',  s:nordic.shadow,         '',  '')
call s:hi('StealthPunctuationComment', s:syntax.comment,        '',  '')
call s:hi('StealthPunctuationBasic',   s:special.punctuation,   '',  '')

" ============================================================================
" HTML/XML
" ============================================================================

call s:hi('htmlTag',     s:special.tag,      '',  '')
call s:hi('htmlEndTag',  s:special.tag,      '',  '')
call s:hi('htmlTagName', s:nordic.sky,       '',  'bold')
call s:hi('htmlArg',     s:special.tag_attr, '',  '')
call s:hi('htmlString',  s:syntax.string,    '',  '')

" ============================================================================
" JAVASCRIPT/TYPESCRIPT
" ============================================================================

call s:hi('javaScriptFunction', s:syntax.keyword, '',  'bold')
call s:hi('javaScriptBraces',   s:special.punctuation, '', '')
call s:hi('javaScriptNumber',   s:syntax.number,  '',  '')
call s:hi('typescriptImport',   s:nordic.ocean,   '',  'bold')
call s:hi('typescriptExport',   s:nordic.ocean,   '',  'bold')

" ============================================================================
" CSS
" ============================================================================

call s:hi('cssBraces',    s:special.punctuation, '',  '')
call s:hi('cssClassName', s:special.class_name,  '',  '')
call s:hi('cssColor',     s:syntax.number,       '',  '')
call s:hi('cssProp',      s:nordic.sky,          '',  '')

" ============================================================================
" RUBY
" ============================================================================

call s:hi('rubyClass',               s:syntax.keyword,         '',  'bold')
call s:hi('rubyFunction',            s:syntax.function,        '',  '')
call s:hi('rubyInterpolationDelimiter', s:special.punct_special, '', '')
call s:hi('rubySymbol',              s:nordic.ocean,           '',  '')
call s:hi('rubyConstant',            s:special.class_name,     '',  'bold')
call s:hi('rubyStringDelimiter',     s:special.punctuation,    '',  '')
call s:hi('rubyBlockParameter',      s:syntax.parameter,       '',  '')
call s:hi('rubyInstanceVariable',    s:syntax.variable,        '',  '')
call s:hi('rubyInclude',             s:syntax.keyword,         '',  'bold')
call s:hi('rubyGlobalVariable',      s:syntax.constant,        '',  '')
call s:hi('rubyRegexp',              s:nordic.deep,            '',  '')
call s:hi('rubyRegexpDelimiter',     s:special.punctuation,    '',  '')
call s:hi('rubyEscape',              s:special.punct_special,  '',  '')
call s:hi('rubyControl',             s:syntax.keyword,         '',  'bold')
call s:hi('rubyClassVariable',       s:syntax.variable,        '',  '')
call s:hi('rubyOperator',            s:special.punct_special,  '',  '')
call s:hi('rubyException',           s:syntax.keyword,         '',  'bold')
call s:hi('rubyPseudoVariable',      s:syntax.constant,        '',  '')

" ============================================================================
" PYTHON
" ============================================================================

call s:hi('pythonImport',    s:nordic.ocean,   '',  'bold')
call s:hi('pythonBuiltin',   s:nordic.sky,     '',  '')
call s:hi('pythonDecorator', s:nordic.deep,    '',  '')

" ============================================================================
" MARKDOWN
" ============================================================================

call s:hi('markdownH1',              s:nordic.ice,          '',  'bold')
call s:hi('markdownH2',              s:nordic.frost,        '',  'bold')
call s:hi('markdownH3',              s:nordic.sky,          '',  'bold')
call s:hi('markdownH4',              s:nordic.ocean,        '',  'bold')
call s:hi('markdownH5',              s:nordic.deep,         '',  'bold')
call s:hi('markdownH6',              s:nordic.midnight,     '',  'bold')
call s:hi('markdownHeadingDelimiter', s:special.punctuation, '', '')
call s:hi('markdownBold',            s:fg.bright,           '',  'bold')
call s:hi('markdownItalic',          s:fg.normal,           '',  'italic')
call s:hi('markdownCode',            s:syntax.string,       s:bg.subtle, '')
call s:hi('markdownCodeBlock',       s:syntax.string,       s:bg.subtle, '')
call s:hi('markdownLinkText',        s:nordic.sky,          '',  'underline')
call s:hi('markdownUrl',             s:nordic.shadow,       '',  'underline')

" ============================================================================
" GIT
" ============================================================================

call s:hi('GitGutterAdd',          s:diff.inserted, s:bg.primary, '')
call s:hi('GitGutterChange',       s:diff.changed,  s:bg.primary, '')
call s:hi('GitGutterDelete',       s:diff.deleted,  s:bg.primary, '')
call s:hi('GitGutterChangeDelete', s:diff.changed,  s:bg.primary, '')

" ============================================================================
" C++
" ============================================================================

call s:hi('cppStatement',    s:syntax.keyword,         '',  'bold')
call s:hi('cppType',         s:syntax.type,            '',  '')
call s:hi('cppStorageClass', s:special.storage,        '',  'bold')
call s:hi('cppStructure',    s:syntax.type,            '',  'bold')
call s:hi('cppException',    s:syntax.keyword,         '',  'bold')
call s:hi('cppOperator',     s:special.punct_special,  '',  '')
call s:hi('cppCast',         s:nordic.ocean,           '',  '')
call s:hi('cppBoolean',      s:syntax.constant,        '',  '')
call s:hi('cppConstant',     s:syntax.constant,        '',  '')
call s:hi('cppModifier',     s:syntax.keyword,         '',  '')
call s:hi('cppNumber',       s:syntax.number,          '',  '')
call s:hi('cppString',       s:syntax.string,          '',  '')
call s:hi('cppIdentifier',   s:syntax.variable,        '',  '')
call s:hi('cppDelimiter',    s:special.punctuation,    '',  '')
call s:hi('cppBracket',      s:special.punctuation,    '',  '')
call s:hi('cppAccess',       s:special.punct_special,  '',  '')
call s:hi('cppSymbol',       s:special.punctuation,    '',  '')

" C++ syntax matches
au FileType cpp syntax match cppSpecialSymbol /[&*<>=:;,.\-+!|?]/
au FileType cpp syntax match cppBracket /[\[\](){}<>]/
au FileType cpp syntax match cppCastOperator /\<static_cast\>\|\<dynamic_cast\>\|\<const_cast\>\|\<reinterpret_cast\>/
au FileType cpp syntax match cppAccess /\.\|->/

" ============================================================================
" HIGHLIGHT LINKS - Standard Groups
" ============================================================================

hi! link Character       String
hi! link Boolean         Constant
hi! link Float           Number
hi! link Repeat          Statement
hi! link Label           Statement
hi! link Exception       Statement
hi! link Include         PreProc
hi! link Define          PreProc
hi! link Macro           PreProc
hi! link PreCondit       PreProc
hi! link StorageClass    Type
hi! link Typedef         Type
hi! link Tag             Special
hi! link SpecialComment  Special
hi! link Debug           Special
hi! link Directory       Constant
hi! link MoreMsg         Constant
hi! link Question        Constant
hi! link WarningMsg      Error

" ============================================================================
" HIGHLIGHT LINKS - Punctuation
" ============================================================================

hi! link Punctuation                  StealthPunctuation
hi! link punctuation.definition       StealthPunctuation
hi! link punctuation.definition.string StealthPunctuation
hi! link Comma                         StealthPunctuationBasic
hi! link Period                        StealthPunctuationBasic
hi! link Semicolon                     StealthPunctuationBasic
hi! link Colon                         StealthPunctuationBasic
hi! link punctuation.definition.list   StealthPunctuationList
hi! link punctuation.definition.angle  StealthPunctuationAngle
hi! link punctuation.separator         StealthPunctuationSep
hi! link punctuation.terminator        StealthPunctuationTerm
hi! link punctuation.accessor          StealthPunctuationAccess
hi! link punctuation.definition.comment StealthPunctuationComment

" ============================================================================
" HIGHLIGHT LINKS - C++
" ============================================================================

hi! link cppSpecialSymbol StealthPunctuation
hi! link cppBracket      StealthPunctuation
hi! link cppCastOperator cppCast
hi! link cppAccess       StealthPunctuationAccess
hi! link cppSTL          Type
hi! link cppSTLType      Type
hi! link cppSTLFunction  Function
hi! link cppSTLConstant  Constant
hi! link cppSTLNamespace Identifier
hi! link cppScopeDelim   StealthPunctuation
hi! link cppTemplateParam Type

" ============================================================================
" HIGHLIGHT LINKS - Language-specific Punctuation
" ============================================================================

hi! link jsxBraces          StealthPunctuation
hi! link jsBraces           StealthPunctuation
hi! link typescriptBraces   StealthPunctuation
hi! link phpParent          StealthPunctuation
hi! link cssBraces          StealthPunctuation
hi! link pythonBrackets     StealthPunctuation
hi! link javaBraces         StealthPunctuation
hi! link htmlTag            StealthPunctuation
hi! link xmlTag             StealthPunctuation

" ============================================================================
" SYNTAX MATCHES - Basic Punctuation
" ============================================================================

au FileType * syntax match StealthComma /,/ containedin=ALL
au FileType * syntax match StealthPeriod /\./ containedin=ALL
au FileType * syntax match StealthSemicolon /;/ containedin=ALL
au FileType * syntax match StealthColon /:/ containedin=ALL

hi! link StealthComma StealthPunctuationBasic
hi! link StealthPeriod StealthPunctuationBasic
hi! link StealthSemicolon StealthPunctuationBasic
hi! link StealthColon StealthPunctuationBasic

" Language-specific punctuation matches
au FileType javascript,typescript,jsx,tsx,css,scss,less,php,python,ruby,go,rust,java,c,cpp syntax clear StealthComma StealthPeriod StealthSemicolon StealthColon
au FileType javascript,typescript,jsx,tsx,css,scss,less,php,python,ruby,go,rust,java,c,cpp syntax match StealthComma /,/ containedin=ALL
au FileType javascript,typescript,jsx,tsx,css,scss,less,php,python,ruby,go,rust,java,c,cpp syntax match StealthPeriod /\./ containedin=ALL
au FileType javascript,typescript,jsx,tsx,css,scss,less,php,python,ruby,go,rust,java,c,cpp syntax match StealthSemicolon /;/ containedin=ALL
au FileType javascript,typescript,jsx,tsx,css,scss,less,php,python,ruby,go,rust,java,c,cpp syntax match StealthColon /:/ containedin=ALL

" ============================================================================
" TAB/BUFFER HIGHLIGHTING
" ============================================================================

call s:hi('BufferCurrent',        s:ui.white,    s:bg.active_tab, '')
call s:hi('BufferCurrentMod',     s:ui.notify,   s:bg.active_tab, '')
call s:hi('BufferCurrentSign',    s:nordic.sky,  s:bg.active_tab, '')
call s:hi('BufferCurrentTarget',  s:ui.error,    s:bg.active_tab, 'bold')

call s:hi('BufferVisible',        s:fg.normal,   s:bg.tab, '')
call s:hi('BufferVisibleMod',     s:ui.notify,   s:bg.tab, '')
call s:hi('BufferVisibleSign',    s:fg.dim,      s:bg.tab, '')
call s:hi('BufferVisibleTarget',  s:ui.error,    s:bg.tab, 'bold')

call s:hi('BufferInactive',       s:fg.dim,      s:bg.tab, '')
call s:hi('BufferInactiveMod',    s:ui.notify,   s:bg.tab, '')
call s:hi('BufferInactiveSign',   s:fg.dimmer,   s:bg.tab, '')
call s:hi('BufferInactiveTarget', s:ui.error,    s:bg.tab, 'bold')

call s:hi('BufferTabpages',       s:nordic.sky,  s:bg.tab, 'bold')
call s:hi('BufferTabpageFill',    '',            s:bg.tab, '')

" Standard Vim tab highlighting
call s:hi('TabLine',              s:fg.normal,   s:bg.tab, '')
call s:hi('TabLineFill',          '',            s:bg.tab, '')
call s:hi('TabLineSel',           s:ui.white,    s:bg.tab, 'bold')

" ============================================================================
" TERMINAL COLORS (Nordic palette)
" ============================================================================

if has('nvim')
  let g:terminal_color_0  = '#0a0b0c'
  let g:terminal_color_1  = '#c87c7a'
  let g:terminal_color_2  = '#6a95a5'
  let g:terminal_color_3  = '#7a98ad'
  let g:terminal_color_4  = '#8fa9bb'
  let g:terminal_color_5  = '#a8bcc9'
  let g:terminal_color_6  = '#91a6b8'
  let g:terminal_color_7  = '#bfc8d2'
  let g:terminal_color_8  = '#4a5c6d'
  let g:terminal_color_9  = '#d89090'
  let g:terminal_color_10 = '#7a98ad'
  let g:terminal_color_11 = '#8fa9bb'
  let g:terminal_color_12 = '#a8bcc9'
  let g:terminal_color_13 = '#c8d5e0'
  let g:terminal_color_14 = '#91a6b8'
  let g:terminal_color_15 = '#d0d8e0'
endif

" Low color terminal support
if &t_Co < 256
  let g:stealth_contrast_low_color = 1
endif
