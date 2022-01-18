" Hiccup Theme for Vim
" Author: Huy Tran
" License: BSD 3 Clauses

highlight clear

if exists('syntax_on')
    syntax reset
endif

set background=dark
let g:colors_name = 'hiccup'

" Color Palette
let s:gray1     = '#20242e'
let s:gray2     = '#2a3139'
let s:gray3     = '#333a45'
let s:gray4     = '#546072'
let s:gray5     = '#e0e2e4'

" Github Dark
let s:error     = '#d98285'
let s:red       = '#d98285'
let s:green     = '#85e89d'
let s:yellow    = '#ffab70'
let s:blue      = '#92b9f0'
let s:purple    = '#8acfbb'
let s:cyan      = '#73daca'
let s:orange    = '#ffab70'
let s:indigo    = '#e1e4e8'

function! s:HL(group, fg, bg, attr)
    let l:attr = a:attr

    if !empty(a:fg)
        exec 'hi ' . a:group . ' guifg=' . a:fg
    endif
    if !empty(a:bg)
        exec 'hi ' . a:group . ' guibg=' . a:bg
    endif
    if !empty(a:attr)
        exec 'hi ' . a:group . ' gui=' . l:attr . ' cterm=' . l:attr
    endif
endfun

call s:HL('Bold', '', '', 'bold')
call s:HL('Italic', '', '', 'italic')

" Vim Editor
call s:HL('ColorColumn',                    '',         s:gray2,    '')
call s:HL('Cursor',                         s:gray2,    s:gray5,    '')
call s:HL('CursorColumn',                   '',         s:gray2,    '')
call s:HL('CursorLine',                     '',         s:gray2,    'none')
call s:HL('CursorLineNr',                   s:cyan,     s:gray2,    'none')
call s:HL('Directory',                      s:blue,     '',         '')
call s:HL('DiffAdd',                        s:green,    s:gray2,    'none')
call s:HL('DiffChange',                     s:yellow,   s:gray2,    'none')
call s:HL('DiffDelete',                     s:error,      s:gray2,    'none')
call s:HL('DiffText',                       s:blue,     s:gray2,    'none')
call s:HL('ErrorMsg',                       s:error,      s:gray1,    'bold')
call s:HL('FoldColumn',                     s:gray4,    s:gray1,    '')
call s:HL('Folded',                         s:gray3,    s:gray1,    '')
call s:HL('IncSearch',                      s:yellow,   '',         '')
call s:HL('LineNr',                         s:gray3,    s:gray1,         '')
call s:HL('MatchParen',                     s:gray4,    s:cyan,     'bold')
call s:HL('ModeMsg',                        s:green,    '',         '')
call s:HL('MoreMsg',                        s:green,    '',         '')
call s:HL('NonText',                        s:gray4,    s:gray1,    'none')
call s:HL('Normal',                         s:gray5,    s:gray1,    'none')
call s:HL('Pmenu',                          s:gray5,    s:gray3,    '')
call s:HL('PmenuSbar',                      '',         s:gray2,    '')
call s:HL('PmenuSel',                       s:gray2,    s:cyan,     '')
call s:HL('PmenuThumb',                     '',         s:gray4,    '')
call s:HL('Question',                       s:blue,     '',         'none')
call s:HL('Search',                         s:gray1,    s:yellow,   '')
call s:HL('SignColumn',                     s:gray5,    s:gray1,    '')
call s:HL('SpecialKey',                     s:gray4,    '',         '')
call s:HL('SpellCap',                       s:blue,     s:gray2,    'undercurl')
call s:HL('SpellBad',                       s:error,      s:gray2,    'undercurl')
call s:HL('StatusLine',                     s:gray4,    s:gray3,    'none')
call s:HL('StatusLineNC',                   s:gray2,    s:gray4,    '')
call s:HL('TabLine',                        s:gray4,    s:gray2,    'none')
call s:HL('TabLineFill',                    s:gray4,    s:gray2,    'none')
call s:HL('TabLineSel',                     s:yellow,   s:gray3,    'none')
call s:HL('Title',                          s:green,    '',         'none')
call s:HL('VertSplit',                      s:gray3,    s:gray1,    'none')
call s:HL('Visual',                         s:gray5,    s:gray3,    '')
call s:HL('WarningMsg',                     s:error,      '',         '')
call s:HL('WildMenu',                       s:gray2,    s:cyan,	    '')
call s:HL('EndOfBuffer',                    s:gray3,    s:gray1,    'none')

" Standard Syntax
call s:HL('Boolean',                        s:orange,   '',         '')
call s:HL('Delimiter',                      s:indigo,   '',         '')
call s:HL('Float',                          s:cyan,   '',         '')
call s:HL('Number',                         s:cyan,   '',         '')
call s:HL('Keyword',                        s:blue,   '',         '')
call s:HL('StorageClass',                   s:blue,   '',         '')
call s:HL('Tag',                            s:orange,   '',         '')
call s:HL('Comment',                        s:gray4,    '',         'italic')
call s:HL('Constant',                       s:purple,   '',         '')
call s:HL('String',                         s:green,    '',         '')
call s:HL('Character',                      s:green,    '',         '')
call s:HL('Identifier',                     s:purple,      '',         'none')
call s:HL('Function',                       s:indigo,     '',         '')
call s:HL('Statement',                      s:blue,   '',         'none')
call s:HL('Operator',                       s:red,     '',         '')
call s:HL('PreProc',                        s:cyan,     '',         '')
call s:HL('Include',                        s:blue,     '',         '')
call s:HL('Define',                         s:blue,   '',         'none')
call s:HL('Type',                           s:purple,   '',         'none')
call s:HL('Typedef',                           s:purple,   '',         'none')
call s:HL('Structure',                      s:purple,     '',         '')
call s:HL('Special',                        s:indigo,   '',         '')
call s:HL('Underlined',                     s:blue,     '',         'none')
call s:HL('Error',                          s:error,      s:gray1,    'bold')
call s:HL('Todo',                           s:orange,   s:gray1,    'bold')
hi! link Macro Define
hi! link PreCondit PreProc

" CSS
call s:HL('cssAttrComma',                   s:gray5,    '',         '')
call s:HL('cssPseudoClassId',               s:green,   '',         '')
call s:HL('cssBraces',                      s:gray5,    '',         '')
call s:HL('cssClassName',                   s:blue,   '',         '')
call s:HL('cssClassNameDot',                s:gray5,   '',         '')
call s:HL('cssFunctionName',                s:blue,     '',         '')
call s:HL('cssImportant',                   s:red,     '',         '')
call s:HL('cssIncludeKeyword',              s:red,   '',         '')
call s:HL('cssTagName',                     s:red,      '',         '')
call s:HL('cssMediaType',                   s:green,   '',         '')
call s:HL('cssProp',                        s:blue,    '',         '')
call s:HL('cssSelectorOp',                  s:cyan,     '',         '')
call s:HL('cssSelectorOp2',                 s:cyan,     '',         '')

" Commit Messages (Git)
call s:HL('gitcommitHeader',                s:purple,   '',         '')
call s:HL('gitcommitUnmerged',              s:green,    '',         '')
call s:HL('gitcommitSelectedFile',          s:green,    '',         '')
call s:HL('gitcommitDiscardedFile',         s:error,      '',         '')
call s:HL('gitcommitUnmergedFile',          s:yellow,   '',         '')
call s:HL('gitcommitSelectedType',          s:green,    '',         '')
call s:HL('gitcommitSummary',               s:blue,     '',         '')
call s:HL('gitcommitDiscardedType',         s:error,      '',         '')
hi link gitcommitNoBranch       gitcommitBranch
hi link gitcommitUntracked      gitcommitComment
hi link gitcommitDiscarded      gitcommitComment
hi link gitcommitSelected       gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow  gitcommitSelectedFile
hi link gitcommitUnmergedArrow  gitcommitUnmergedFile

" HTML
call s:HL('htmlEndTag',                     s:blue,     '',         '')
call s:HL('htmlLink',                       s:red,      '',         '')
call s:HL('htmlTag',                        s:blue,     '',         '')
call s:HL('htmlTitle',                      s:gray5,    '',         '')
call s:HL('htmlSpecialTagName',             s:blue,   '',         '')

" Javascript
call s:HL('javaScriptBraces',               s:gray5,    '',         '')
call s:HL('javaScriptNull',                 s:orange,   '',         '')
call s:HL('javaScriptIdentifier',           s:blue,   '',         '')
call s:HL('javaScriptNumber',               s:orange,   '',         '')
call s:HL('javaScriptRequire',              s:cyan,     '',         '')
call s:HL('javaScriptReserved',             s:blue,   '',         '')
" pangloss/vim-javascript
call s:HL('jsArrowFunction',                s:blue,   '',         '')
call s:HL('jsAsyncKeyword',                 s:blue,   '',         '')
call s:HL('jsExtendsKeyword',               s:red,   '',         '')
call s:HL('jsClassKeyword',                 s:red,   '',         '')
call s:HL('jsDocParam',                     s:green,    '',         '')
call s:HL('jsDocTags',                      s:cyan,     '',         '')
call s:HL('jsForAwait',                     s:blue,   '',         '')
call s:HL('jsFlowArgumentDef',              s:yellow,   '',         '')
call s:HL('jsFrom',                         s:blue,   '',         '')
call s:HL('jsImport',                       s:red,   '',         '')
call s:HL('jsExport',                       s:red,   '',         '')
call s:HL('jsExportDefault',                s:red,   '',         '')
call s:HL('jsFuncCall',                     s:blue,     '',         '')
call s:HL('jsFunction',                     s:blue,   '',         '')
call s:HL('jsGlobalObjects',                s:yellow,   '',         '')
call s:HL('jsGlobalNodeObjects',            s:yellow,   '',         '')
call s:HL('jsModuleAs',                     s:blue,   '',         '')
call s:HL('jsNull',                         s:orange,   '',         '')
call s:HL('jsStorageClass',                 s:blue,   '',         '')
call s:HL('jsTemplateBraces',               s:red,      '',         '')
call s:HL('jsTemplateExpression',           s:red,      '',         '')
call s:HL('jsThis',                         s:red,      '',         '')
call s:HL('jsUndefined',                    s:orange,   '',         '')

" JSON
call s:HL('jsonBraces',                     s:gray5,    '',         '')

" Less
call s:HL('lessAmpersand',                  s:red,      '',         '')
call s:HL('lessClassChar',                  s:yellow,   '',         '')
call s:HL('lessCssAttribute',               s:gray5,    '',         '')
call s:HL('lessFunction',                   s:blue,     '',         '')
call s:HL('lessVariable',                   s:purple,   '',         '')

" Markdown
call s:HL('markdownBold',                   s:yellow,   '',         'bold')
call s:HL('markdownCode',                   s:cyan,     '',         '')
call s:HL('markdownCodeBlock',              s:cyan,     '',         '')
call s:HL('markdownCodeDelimiter',          s:cyan,     '',         '')
call s:HL('markdownHeadingDelimiter',       s:green,    '',         '')
call s:HL('markdownHeadingRule',            s:gray4,    '',         '')
call s:HL('markdownId',                     s:purple,   '',         '')
call s:HL('markdownItalic',                 s:blue,     '',         'italic')
call s:HL('markdownListMarker',             s:orange,   '',         '')
call s:HL('markdownOrderedListMarker',      s:orange,   '',         '')
call s:HL('markdownRule',                   s:gray4,    '',         '')
call s:HL('markdownUrl',                    s:purple,   '',         '')
call s:HL('markdownUrlTitleDelimiter',      s:green,    '',         '')

" Ruby
call s:HL('rubyInterpolation',              s:cyan,     '',         '')
call s:HL('rubyInterpolationDelimiter',     s:indigo,   '',         '')
call s:HL('rubyRegexp',                     s:cyan,     '',         '')
call s:HL('rubyRegexpDelimiter',            s:indigo,   '',         '')
call s:HL('rubyStringDelimiter',            s:green,    '',         '')

" Sass
call s:HL('sassAmpersand',                  s:red,      '',         '')
call s:HL('sassClassChar',                  s:yellow,   '',         '')
call s:HL('sassMixinName',                  s:blue,     '',         '')
call s:HL('sassVariable',                   s:purple,   '',         '')

" Vim-Fugitive
call s:HL('diffAdded',                      s:green,    '',         '')
call s:HL('diffRemoved',                    s:error,      '',         '')

" Vim-Gittgutter
call s:HL('GitGutterAdd',                   s:green,    '',         '')
call s:HL('GitGutterChange',                s:yellow,   '',         '')
call s:HL('GitGutterChangeDelete',          s:orange,   '',         '')
call s:HL('GitGutterDelete',                s:error,      '',         '')

" Vim-Signify
hi link SignifySignAdd GitGutterAdd
hi link SignifySignChange GitGutterChange
hi link SignifySignDelete GitGutterDelete

" XML
call s:HL('xmlAttrib',                      s:yellow,   '',         '')
call s:HL('xmlEndTag',                      s:blue,     '',         '')
call s:HL('xmlTag',                         s:blue,     '',         '')
call s:HL('xmlTagName',                     s:blue,     '',         '')

hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier

hi! link cOperator Operator
hi! link cPreCondit PreCondit

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword


" Neovim terminal colors
if has('nvim')
    let g:terminal_color_0 = s:gray1
    let g:terminal_color_1 = s:red
    let g:terminal_color_2 = s:green
    let g:terminal_color_3 = s:yellow
    let g:terminal_color_4 = s:blue
    let g:terminal_color_5 = s:purple
    let g:terminal_color_6 = s:cyan
    let g:terminal_color_7 = s:gray5
    let g:terminal_color_8 = s:gray3
    let g:terminal_color_9 = s:red
    let g:terminal_color_10 = s:green
    let g:terminal_color_11 = s:yellow
    let g:terminal_color_12 = s:blue
    let g:terminal_color_13 = s:purple
    let g:terminal_color_14 = s:cyan
    let g:terminal_color_15 = s:gray4
    let g:terminal_color_background = g:terminal_color_0
    let g:terminal_color_foreground = g:terminal_color_7
endif
