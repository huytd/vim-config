call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'huytd/vim-quickrun'
Plug 'sheerun/vim-polyglot'
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cormacrelf/vim-colors-github'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'rakr/vim-two-firewatch'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-abolish' " For case perserved subtitue :%S
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'eugen0329/vim-esearch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 't9md/vim-choosewin'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'kaicataldo/material.vim'
Plug 'Yggdroot/indentLine'
call plug#end()

filetype plugin indent on

"Todo file
autocmd BufNewFile,BufRead *.todo set syntax=todo

" Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e

set encoding=UTF-8
set hidden
set nobackup
set nowritebackup
set mouse=a " enable mouse for all mode
set cursorline

set foldmethod=indent
set foldlevel=99

let g:is_posix = 1

set noswapfile
set nojoinspaces
set nowrap
set number
set ttyfast
set laststatus=2
set ttimeout
set ttimeoutlen=10
set termguicolors
set ignorecase
set relativenumber

" Vim color highlighting
let g:Hexokinase_highlighters = ['virtual']
let g:Hexokinase_virtualText = '▩'

" FZF config
let g:fzf_layout = { 'window': {
      \ 'width': 0.9,
      \ 'height': 0.7,
      \ 'highlight': 'Comment',
      \ 'rounded': v:false } }
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" Indent Guide
let g:indentLine_char = '│'
let g:indentLine_color_gui = '#3a3f58'

" Esearch config
let g:esearch = {
  \ 'adapter': 'rg',
  \ 'backend': 'nvim'
  \}
call esearch#out#win#map('<Enter>', 'tab')

" JS config
let g:javascript_plugin_jsdoc = 1
let g:polyglot_disabled = ['jsx', 'tsx', 'js', 'ts']
let g:vim_jsx_pretty_template_tags = ['html', 'jsx', 'tsx']

" Custom icon for coc.nvim statusline
let g:coc_status_error_sign=" "
let g:coc_status_warning_sign=" "

" I don't use recording, don't judge me
map q <Nop>
inoremap jk <ESC>
vnoremap <M-/> <Esc>/\%V
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap L l
nnoremap H h
nnoremap l w
nnoremap h b

" Map Emacs like movement in Insert mode
" inoremap <C-n> <Down>
" inoremap <C-p> <Up>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^

" Remap scrolling
nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>

set background=dark
let g:material_theme_style = 'palenight'
let g:material_terminal_italics = 1
colo material

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

set listchars=tab:>·,trail:~,extends:>,precedes:<
set list

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

set autoindent
set smartindent

" Persistent undo
" Don't forget mkdir folder $HOME/.vim/undo
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=10000

set updatetime=300

let g:NERDSpaceDelims = 1
map mm <Plug>NERDCommenterToggle

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set wildoptions=pum
set pumblend=20
" Floating Term
let s:float_term_border_win = 0
let s:float_term_win = 0
function! FloatTerm(...)
  " Configuration
  let height = float2nr((&lines - 2) * 0.6)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.6)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': col - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }
  " Terminal Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  let top = "╭" . repeat("─", width + 2) . "╮"
  let mid = "│" . repeat(" ", width + 2) . "│"
  let bot = "╰" . repeat("─", width + 2) . "╯"
  let lines = [top] + repeat([mid], height) + [bot]
  let bbuf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
  let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
  let buf = nvim_create_buf(v:false, v:true)
  let s:float_term_win = nvim_open_win(buf, v:true, opts)
  " Styling
  hi FloatWinBorder guifg=#87bb7c
  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:FloatWinBorder')
  call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')
  if a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif
  startinsert
  " Close border window when terminal window close
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction

" Key binding
let mapleader=" "
nnoremap <Leader>l :vsplit<CR>
nnoremap <Leader>k :split<CR>
nnoremap <Leader>wh :wincmd h<CR>
nnoremap <Leader>wl :wincmd l<CR>
nnoremap <Leader>wk :wincmd k<CR>
nnoremap <Leader>wj :wincmd j<CR>
nnoremap <Leader>w= :wincmd =<CR>
nnoremap <Leader>e :QuickRunExecute<CR>
nnoremap <Leader>wb :e#<CR>
nnoremap <Leader>qq :bd<CR>
nnoremap <Leader>qk :call DeleteCurrentFileAndBuffer()<CR>
nnoremap <Leader>ss :mksession! .vimsession<CR>
nnoremap <Leader>sr :so .vimsession<CR>
nnoremap <Leader><Leader>r :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>n :NERDTree<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
"Buffer
nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>
nnoremap <Leader>tc :tabe<CR>
nnoremap <Leader>tx :tabclose<CR>
" Jump window
nmap <Leader>ww <Plug>(choosewin)

" Open terminal
nnoremap <Leader>at :call FloatTerm()<CR>
" Open tig, yes TIG, A FLOATING TIGGGG!!!!!!
nnoremap <Leader>ag :call FloatTerm('"tig"')<CR>

nnoremap <silent> <Leader>pf :Files<CR>
nnoremap <silent> <Leader>pt :Buffers<CR>
nnoremap <silent> <Leader>pb :Buffers<CR>
nnoremap <silent> <Leader>pr :History<CR>
nnoremap <silent> <c-\> :call esearch#init()<CR>
nnoremap <silent> \ :Rg<CR>
nnoremap <silent> <c-o> :CocList outline<CR>

" Choose win
let g:choosewin_overlay_enable = 1

" NERDTree config
let NERDTreeMinimalUI=1

" Turn off whitespaces compare and folding in vimdiff
set splitright
silent! set splitvertical
set diffopt+=iwhite
set diffopt+=vertical
nnoremap <Leader>1 :diffget 1<CR>:diffupdate<CR>
nnoremap <Leader>2 :diffget 2<CR>:diffupdate<CR>

set clipboard=unnamed

function! DeleteCurrentFileAndBuffer()
  call delete(expand('%'))
  bdelete!
endfunction

function! DrawGitBranchInfo()
  let branch = fugitive#head()
  return len(branch) > 0 ? " " . branch : ""
endfunction

function! MyFiletype()
  " return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : '') : ''
  return ''
endfunction

function! LightLineFilename()
  let name = ""
  let subs = split(expand('%'), "/")
  let i = 1
  for s in subs
    let parent = name
    if  i == len(subs)
      let name = len(parent) > 0 ? parent . '/' . s : s
    elseif i == 1
      let name = s
    else
      let part = strpart(s, 0, 10)
      let name = len(parent) > 0 ? parent . '/' . part : part
    endif
    let i += 1
  endfor
  return name
endfunction

let g:lightline = {
      \ 'colorscheme': 'material_vim',
      \ 'active': {
      \   'left': [ [], [ 'filename' ] ],
      \   'right': [ [], ['cocstatus', 'lineinfo', 'icongitbranch'] ]
      \ },
      \ 'inactive': {
      \   'left': [ ['fileicon'], [ 'filename' ] ],
      \   'right': []
      \ },
      \ 'component': { 'lineinfo': ' %2p%% %3l:%-2v' },
      \ 'component_function': {
      \   'fileicon': 'MyFiletype',
      \   'icongitbranch': 'DrawGitBranchInfo',
      \   'iconline': 'DrawLineInfo',
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'filename': 'LightLineFilename',
      \ },
      \ }

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Remap for format selected region
xmap <leader><leader>f  <Plug>(coc-format-selected)
nmap <leader><leader>f  <Plug>(coc-format-selected)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>ar  <Plug>(coc-rename)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{StatusDiagnostic()}

" Nerdtree Sync
let g:nerdtree_sync_cursorline = 1
let g:NERDTreeHighlightCursorline = 1

" Multiple Cursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_select_all_word_key = '<C-L>'
let g:multi_cursor_start_key           = 'g<C-d>'
let g:multi_cursor_select_all_key      = 'g<C-L>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-i>'
let g:multi_cursor_quit_key            = '<Esc>'

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Some custom style
highlight SignColumn guibg=NONE
highlight EasyMotionTargetDefault guifg=#ffb400
highlight WildMenu guifg=#87bb7c
highlight VertSplit guifg=#1f2329
highlight CocInfoSign guifg=#55606d
highlight CocInfoFloat guifg=#dde0e4
highlight DiffAdd guibg=NONE
highlight DiffAdded guibg=NONE
highlight DiffChange guibg=NONE
highlight DiffDelete guibg=NONE
highlight CursorLine guibg=#33384d
