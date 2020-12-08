set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "tutti"

highlight Normal                    guifg=#000000 guibg=#ffffff
highlight Cursor                    guifg=#000000 guibg=#cccecf
highlight CursorLine                              guibg=NONE
highlight Visual                                  guibg=#dbebff
highlight Search                                  guibg=#fbe9ad

highlight NonText                   guifg=#e2e8ef guibg=#fefeff
highlight MatchParen                              guibg=#d4e9fa

highlight SignColumn                              guibg=NONE
highlight LineNr                    guifg=#d1d1d1 guibg=NONE
highlight FoldColumn                guifg=#aabbcc guibg=#f2f8ff
highlight Folded                    guifg=#667788 guibg=#f2f8ff

highlight StatusLine                guifg=#888888 guibg=#ffffff
highlight StatusLineNC              guifg=#bbbbbb guibg=#ffffff
highlight VertSplit                 guifg=#d1d1d1 guibg=NONE gui=NONE

highlight Comment                   guifg=#a1a1a1 guibg=NONE
highlight Constant                  guifg=#7653c1 guibg=#f3f2ff
highlight Error                     guifg=#f9f2ce guibg=#f9323a
highlight Identifier                guifg=#222222 guibg=NONE
highlight Number                    guifg=#7653c1 guibg=#f3f2ff
highlight PreProc                   guifg=#7653c1 guibg=#f3f2ff
highlight Special                   guifg=#2f6f9f guibg=#f4faff gui=NONE
highlight Statement                 guifg=#2f6f9f guibg=#f4faff gui=NONE
highlight Type                      guifg=#2f6f9f guibg=#f4faff gui=NONE
highlight Title                     guifg=#000000 guibg=NONE    gui=NONE
highlight Underlined                                            gui=underline
highlight String                    guifg=#73b00a guibg=NONE

highlight Pmenu                                   guibg=#e8e8e8
highlight DiffChange                guifg=#81C7FF guibg=NONE
highlight DiffAdd                   guifg=#73b00a guibg=NONE
highlight DiffDelete                guifg=#D1363D guibg=NONE

highlight CocRustChainingHint       guifg=#a1a1a1
highlight CocRustTypeHint       guifg=#a1a1a1
" html/css/javascript

highlight htmlHead                                guibg=#ffffff
highlight javaScript                guifg=#434343 guibg=#ffffff
