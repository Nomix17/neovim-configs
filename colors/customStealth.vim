" customStealth.vim - Enhanced subtle dark theme with improved hierarchy
" Converted from VSCode theme stealth-contrast
" Maintainer: Nomix17 
" Last Change: 2025-10-11

" Reset all highlighting to start fresh
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "customStealth"
set background=dark

" ============================================================================
" COLOR PALETTE
" ============================================================================
" Define all colors in one place for easy modification

" Background & UI Colors
let s:bg = {
  \ 'primary':      '#0d0e0f',
  \ 'highlight':    '#141617',
  \ 'subtle':       '#191b1d',
  \ 'selection':    '#333536',
  \ }

" Foreground & Text Colors (Brightness Hierarchy)
let s:fg = {
  \ 'brightest':    '#a0a7ae',
  \ 'bright':       '#9da3aa',
  \ 'normal':       '#7a8088',
  \ 'dim':          '#6a7179',
  \ 'dimmer':       '#5d6268',
  \ 'dimmest':      '#4a4f55',
  \ }

" Syntax Element Colors (Organized by importance)
let s:syntax = {
  \ 'keyword':      '#9da3aa',
  \ 'constant':     '#969ca3',
  \ 'number':       '#8a9099',
  \ 'type':         '#858c93',
  \ 'function':     '#7d848c',
  \ 'string':       '#6b7178',
  \ 'variable':     '#6a7179',
  \ 'parameter':    '#6e757d',
  \ 'comment':      '#3d4247',
  \ }

" Special Purpose Colors
let s:special = {
  \ 'punctuation':       '#4a4f55',
  \ 'punct_special':     '#5d6268',
  \ 'tag':              '#555b61',
  \ 'tag_attr':         '#686e75',
  \ 'library_func':     '#757c84',
  \ 'library_const':    '#8a9099',
  \ 'class_name':       '#969ca3',
  \ 'storage':          '#9da3aa',
  \ }

" UI Element Colors
let s:ui = {
  \ 'cursor':           '#f8f8f0',
  \ 'white':            '#ffffff',
  \ 'line_number':      '#484d53',
  \ 'indent_guide':     '#25272a',
  \ 'error':            '#b87270',
  \ 'error_bg':         '#664e4d',
  \ }

" Diff Colors
let s:diff = {
  \ 'deleted':      '#9e6260',
  \ 'inserted':     '#375963',
  \ 'changed':      '#213338',
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
call s:hi('CursorLineNr',  s:fg.brightest,   s:bg.highlight,   '')
call s:hi('Visual',        s:ui.white,       s:bg.selection,   '')
call s:hi('VertSplit',     s:ui.indent_guide, s:ui.indent_guide, '')
call s:hi('MatchParen',    s:ui.white,       s:special.tag,    'bold')
call s:hi('StatusLine',    s:ui.white,       s:bg.highlight,   '')
call s:hi('StatusLineNC',  s:fg.normal,      '#101010',        '')
call s:hi('Pmenu',         s:fg.normal,      '#1e1e1e',        '')
call s:hi('PmenuSel',      s:bg.primary,     s:syntax.keyword, '')
call s:hi('Search',        s:bg.primary,     s:fg.brightest,   '')
call s:hi('IncSearch',     s:bg.primary,     s:ui.white,       '')
call s:hi('ColorColumn',   '',               s:bg.highlight,   '')
call s:hi('SignColumn',    s:fg.normal,      s:bg.primary,     '')
call s:hi('Folded',        s:syntax.comment, s:bg.subtle,      '')
call s:hi('FoldColumn',    s:syntax.comment, s:bg.primary,     '')
call s:hi('NonText',       s:ui.indent_guide, '',              '')
call s:hi('SpecialKey',    s:ui.indent_guide, '',              '')
call s:hi('Title',         s:fg.brightest,   '',               'bold')
call s:hi('ModeMsg',       s:fg.normal,      'NONE',           '')
call s:hi('ErrorMsg',      s:ui.error,       'NONE',           '')
call s:hi('WarningMsg',    s:ui.error,       'NONE',           '')

" Diff highlighting
call s:hi('DiffAdd',       '',               '#a7da1e22',      '')
call s:hi('DiffDelete',    s:ui.error_bg,    s:bg.primary,     '')
call s:hi('DiffChange',    '',               '#f7b83d22',      '')
call s:hi('DiffText',      '',               '#f7b83d44',      '')

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
call s:hi('Underlined',    s:syntax.type,     '',               'underline')
call s:hi('Error',         s:ui.error,        'NONE',           '')
call s:hi('Todo',          s:fg.brightest,    '',               'bold')
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
call s:hi('@lsp.type.namespace', s:syntax.type,      '',  '')
call s:hi('@lsp.type.keyword',   s:syntax.keyword,   '',  'bold')
call s:hi('@lsp.type.macro',     s:special.storage,  '',  '')

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
call s:hi('StealthPunctuationAccess',  s:special.punct_special, '',  '')
call s:hi('StealthPunctuationComment', s:syntax.comment,        '',  '')
call s:hi('StealthPunctuationBasic',   s:special.punctuation,   '',  '')

" ============================================================================
" HTML/XML
" ============================================================================

call s:hi('htmlTag',     s:special.tag,      '',  '')
call s:hi('htmlEndTag',  s:special.tag,      '',  '')
call s:hi('htmlTagName', s:special.tag,      '',  'bold')
call s:hi('htmlArg',     s:special.tag_attr, '',  '')

" ============================================================================
" JAVASCRIPT
" ============================================================================

call s:hi('javaScriptFunction', s:syntax.keyword, '',  'bold')
call s:hi('javaScriptBraces',   s:special.punctuation, '', '')
call s:hi('javaScriptNumber',   s:syntax.number,  '',  '')

" ============================================================================
" CSS
" ============================================================================

call s:hi('cssBraces',    s:special.punctuation, '',  '')
call s:hi('cssClassName', s:special.class_name,  '',  '')
call s:hi('cssColor',     s:syntax.number,       '',  '')

" ============================================================================
" RUBY
" ============================================================================

call s:hi('rubyClass',               s:syntax.keyword,         '',  'bold')
call s:hi('rubyFunction',            s:syntax.function,        '',  '')
call s:hi('rubyInterpolationDelimiter', s:special.punct_special, '', '')
call s:hi('rubySymbol',              s:syntax.constant,        '',  '')
call s:hi('rubyConstant',            s:special.class_name,     '',  'bold')
call s:hi('rubyStringDelimiter',     s:special.punctuation,    '',  '')
call s:hi('rubyBlockParameter',      s:syntax.parameter,       '',  '')
call s:hi('rubyInstanceVariable',    s:syntax.variable,        '',  '')
call s:hi('rubyInclude',             s:syntax.keyword,         '',  'bold')
call s:hi('rubyGlobalVariable',      s:syntax.constant,        '',  '')
call s:hi('rubyRegexp',              s:syntax.string,          '',  '')
call s:hi('rubyRegexpDelimiter',     s:special.punctuation,    '',  '')
call s:hi('rubyEscape',              s:special.punct_special,  '',  '')
call s:hi('rubyControl',             s:syntax.keyword,         '',  'bold')
call s:hi('rubyClassVariable',       s:syntax.variable,        '',  '')
call s:hi('rubyOperator',            s:special.punct_special,  '',  '')
call s:hi('rubyException',           s:syntax.keyword,         '',  'bold')
call s:hi('rubyPseudoVariable',      s:syntax.constant,        '',  '')

" ============================================================================
" MARKDOWN
" ============================================================================

call s:hi('markdownH1',              s:fg.brightest,        '',  'bold')
call s:hi('markdownH2',              s:syntax.constant,     '',  'bold')
call s:hi('markdownH3',              s:syntax.constant,     '',  'bold')
call s:hi('markdownH4',              s:syntax.type,         '',  'bold')
call s:hi('markdownH5',              s:syntax.type,         '',  'bold')
call s:hi('markdownH6',              s:syntax.type,         '',  'bold')
call s:hi('markdownHeadingDelimiter', s:special.punctuation, '', '')
call s:hi('markdownBold',            s:fg.normal,           '',  'bold')
call s:hi('markdownItalic',          s:fg.normal,           '',  'italic')
call s:hi('markdownCode',            s:syntax.string,       '',  '')
call s:hi('markdownCodeBlock',       s:syntax.string,       '',  '')
call s:hi('markdownLinkText',        s:syntax.type,         '',  'underline')
call s:hi('markdownUrl',             s:syntax.comment,      '',  'underline')

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
call s:hi('cppCast',         s:syntax.keyword,         '',  '')
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
" TERMINAL COLORS
" ============================================================================

if has('nvim')
  let g:terminal_color_0  = '#191b1d'
  let g:terminal_color_1  = '#9e6260'
  let g:terminal_color_2  = '#6b7178'
  let g:terminal_color_3  = '#8a9099'
  let g:terminal_color_4  = '#858c93'
  let g:terminal_color_5  = '#969ca3'
  let g:terminal_color_6  = '#7a8088'
  let g:terminal_color_7  = '#9da3aa'
  let g:terminal_color_8  = '#3d4247'
  let g:terminal_color_9  = '#b87270'
  let g:terminal_color_10 = '#7d848c'
  let g:terminal_color_11 = '#969ca3'
  let g:terminal_color_12 = '#9da3aa'
  let g:terminal_color_13 = '#a0a7ae'
  let g:terminal_color_14 = '#8a9099'
  let g:terminal_color_15 = '#b0b7be'
endif

" Low color terminal support
if &t_Co < 256
  let g:stealth_contrast_low_color = 1
endif
