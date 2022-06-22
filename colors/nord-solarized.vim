" Vim color file
" nord-solarized
" Created by Huy Tran with ThemeCreator (https://github.com/mswift42/themecreator)

hi clear

if exists("syntax on")
syntax reset
endif

set t_Co=256
let g:colors_name = "nord-solarized"


" Define reusable colorvariables.
let s:bg="NONE"
let s:fg="#24292e"
let s:fg2="#292825"
let s:fg3="#4e4c45"
let s:fg4="#767368"
let s:bg2="#f0ecde"
let s:bg3="#cdc8b4"
let s:bg4="#d5d1c0"
let s:keyword="#304B44"
let s:builtin="#2F6F9F"
let s:const= "#1155A3"
let s:comment="#c3bda6"
let s:lightcomment="#dfd9c1"
let s:func="#0D5C43"
let s:str="#50750E"
let s:type="#A74047"
let s:value="#A74047"
let s:var="#1155A3"
let s:warning="#F93232"
let s:warning2="#e36209"
let s:highlight="#55efc4"

exe 'hi Normal guifg='s:fg' guibg='s:bg
exe 'hi Cursor guifg='s:bg' guibg='s:fg
exe 'hi CursorLine  guibg='s:bg2
exe 'hi CursorLineNr guifg='s:str' guibg='s:bg
exe 'hi CursorColumn  guibg='s:bg2
exe 'hi ColorColumn  guibg='s:bg2
exe 'hi SignColumn   guibg=NONE'
exe 'hi LineNr guifg='s:lightcomment' guibg='s:bg2
exe 'hi VertSplit guifg='s:bg4' guibg=NONE gui=none'
exe 'hi MatchParen guifg='s:fg'  gui=underline guibg='s:highlight
exe 'hi StatusLine guifg='s:fg2' guibg='s:bg
exe 'hi Pmenu guifg='s:fg' guibg='s:bg2
exe 'hi PmenuSel  guibg='s:bg3
exe 'hi IncSearch guifg='s:bg' guibg='s:keyword
exe 'hi Search   gui=underline guibg='s:highlight
exe 'hi Directory guifg='s:const
exe 'hi Folded guifg='s:fg4' guibg='s:bg
exe 'hi WildMenu guifg='s:str' guibg='s:bg

exe 'hi Boolean guifg='s:value
exe 'hi Comment guifg='s:comment
exe 'hi Conditional guifg='s:keyword' gui=bold'
exe 'hi Constant guifg='s:const
exe 'hi Todo guibg='s:bg
exe 'hi Define guifg='s:keyword
exe 'hi DiffAdd guibg=NONE guifg=#b5ccbe gui=bold'
exe 'hi DiffDelete guifg=#ff0000 guibg=NONE'
exe 'hi DiffChange  guifg=#c1b5cc guibg=NONE'
exe 'hi DiffText guifg=#ffffff guibg=#ff0000 gui=bold'
exe 'hi ErrorMsg guifg='s:warning' guibg='s:bg2' gui=bold'
exe 'hi WarningMsg guifg='s:fg' guibg='s:warning2
exe 'hi Float guifg='s:value
exe 'hi Function guifg='s:func
exe 'hi Identifier guifg='s:var
exe 'hi Keyword guifg='s:keyword'  gui=bold'
exe 'hi Label guifg='s:var
exe 'hi NonText guifg='s:lightcomment' guibg='s:bg
exe 'hi Number guifg='s:value
exe 'hi Operator guifg='s:keyword
exe 'hi PreProc guifg='s:keyword
exe 'hi Special guifg='s:fg
exe 'hi SpecialKey guifg='s:fg2' guibg='s:bg2
exe 'hi Statement guifg='s:keyword
exe 'hi StorageClass guifg='s:type'  gui=italic'
exe 'hi String guifg='s:str
exe 'hi Character guifg='s:str
exe 'hi Tag guifg='s:keyword
exe 'hi Title guifg='s:fg'  gui=bold'
exe 'hi Todo guifg='s:fg2'  gui=inverse,bold'
exe 'hi Type guifg='s:type
exe 'hi Underlined   gui=underline'
exe 'hi Include   gui=bold'
exe 'hi Define   gui=bold'

exe 'hi IndentBlanklineChar  guifg='s:lightcomment
exe 'hi NvimTreeIndentMarker guifg='s:bg2
exe 'hi FloatBorder          guifg=#615f56 guibg='s:bg
exe 'hi NormalFloat          guibg='s:bg

" Neovim Terminal Mode
let g:terminal_color_0 = s:bg
let g:terminal_color_1 = s:warning
let g:terminal_color_2 = s:keyword
let g:terminal_color_3 = s:bg4
let g:terminal_color_4 = s:func
let g:terminal_color_5 = s:builtin
let g:terminal_color_6 = s:fg3
let g:terminal_color_7 = s:str
let g:terminal_color_8 = s:bg2
let g:terminal_color_9 = s:warning2
let g:terminal_color_10 = s:fg2
let g:terminal_color_11 = s:var
let g:terminal_color_12 = s:type
let g:terminal_color_13 = s:const
let g:terminal_color_14 = s:fg4
let g:terminal_color_15 = s:comment

" Ruby Highlighting
exe 'hi rubyAttribute guifg='s:builtin
exe 'hi rubyLocalVariableOrMethod guifg='s:var
exe 'hi rubyGlobalVariable guifg='s:var' gui=italic'
exe 'hi rubyInstanceVariable guifg='s:var
exe 'hi rubyKeyword guifg='s:keyword
exe 'hi rubyKeywordAsMethod guifg='s:keyword' gui=bold'
exe 'hi rubyClassDeclaration guifg='s:keyword' gui=bold'
exe 'hi rubyClass guifg='s:keyword' gui=bold'
exe 'hi rubyNumber guifg='s:const

" Python Highlighting
exe 'hi pythonBuiltinFunc guifg='s:builtin

" Go Highlighting
exe 'hi goBuiltins guifg='s:builtin
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints      = 1
let g:go_highlight_chan_whitespace_error  = 1
let g:go_highlight_extra_types            = 1
let g:go_highlight_fields                 = 1
let g:go_highlight_format_strings         = 1
let g:go_highlight_function_calls         = 1
let g:go_highlight_function_parameters    = 1
let g:go_highlight_functions              = 1
let g:go_highlight_generate_tags          = 1
let g:go_highlight_operators              = 1
let g:go_highlight_space_tab_error        = 1
let g:go_highlight_string_spellcheck      = 1
let g:go_highlight_types                  = 1
let g:go_highlight_variable_assignments   = 1
let g:go_highlight_variable_declarations  = 1

" Javascript Highlighting
exe 'hi jsBuiltins guifg='s:builtin
exe 'hi jsFunction guifg='s:keyword' gui=bold'
exe 'hi jsGlobalObjects guifg='s:type
exe 'hi jsAssignmentExps guifg='s:var

" Html Highlighting
exe 'hi htmlLink guifg='s:var' gui=underline'
exe 'hi htmlStatement guifg='s:keyword
exe 'hi htmlSpecialTagName guifg='s:keyword
exe 'hi htmlTagName gui=bold guifg='s:keyword

" Markdown Highlighting
exe 'hi mkdCode guifg='s:builtin


