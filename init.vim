call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'thinca/vim-quickrun'
Plug 'haya14busa/incsearch.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'peitalin/vim-jsx-typescript'
Plug 'terryma/vim-expand-region'
" LUA ZONE
Plug 'andymass/vim-matchup'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'romgrk/barbar.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'terrortylor/nvim-comment'
Plug 'blackCauldron7/surround.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'ziglang/zig.vim'
" Nvim LSP gang
Plug 'ray-x/go.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-angular'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'simrat39/rust-tools.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'nvim-lua/lsp-status.nvim'
call plug#end()

filetype plugin indent on

" Neovide Config
augroup neovide_gui
  set guifont=Iosevka\ Nerd\ Font:h15
  let g:neovide_cursor_animation_length=0.1
  let g:neovide_cursor_trail_length=0.1
  let g:neovide_floating_blur = 0
  let g:neovide_window_floating_blur = 0
augroup END

" Terminal config
augroup neovim_terminal
  autocmd!
  " Enter Terminal-mode (insert) automatically
  autocmd TermOpen * startinsert
  " Disables number lines on terminal buffers
  autocmd TermOpen * :setlocal nonumber norelativenumber
  " allows you to use Ctrl-c on terminal window
  autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
  " Disable status bar
  autocmd TermOpen * :setlocal laststatus=0
  autocmd TermLeave * :setlocal laststatus=2
augroup END

" Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()

" Rebind C command to close
command -nargs=0 C :close

set encoding=UTF-8
set hidden
set nobackup
set nowritebackup
set mouse=a " enable mouse for all mode
set nocursorline
set foldmethod=indent
set foldlevel=99
set number relativenumber
set fillchars=vert:\│
let &fcs='eob: '
let g:is_posix = 1

set noswapfile
set nojoinspaces
set nowrap
set ttyfast
set laststatus=2
set ttimeout
set ttimeoutlen=10
set termguicolors
set ignorecase

set completeopt=menu,menuone,noselect

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

let bufferline = get(g:, 'bufferline', {})
let bufferline.icon_close_tab = '×'

inoremap jk <ESC>
vnoremap <M-/> <Esc>/\%V
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <C-g><C-g> :nohlsearch<CR>

nnoremap Q <NOP>

nnoremap 0 ^
nnoremap ^ 0

" QWERTY mode
" nnoremap L l
" nnoremap H h
" nnoremap l w
" nnoremap h b

" DVORAK mode
" nnoremap h j
" nnoremap t k
" vnoremap h j
" vnoremap t k

vnoremap p "_dP
nnoremap c "_c
nnoremap C "_C

" Map Emacs like movement in Insert mode
" inoremap <C-n> <Down>
" inoremap <C-p> <Up>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^

" Remap scrolling
nnoremap <C-k> 10kzz
nnoremap <C-j> 10jzz

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set tabstop=4
set softtabstop=4
set shiftwidth=4
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

map mm :CommentToggle<CR>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set wildoptions=pum
set pumblend=1
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

let g:quickrun_config = {}
let g:quickrun_config.go = { 'command': 'go', 'exec': '%c run *.go' }

" Key binding
let mapleader=" "
nnoremap <Leader>l :vsplit<CR>
nnoremap <Leader>k :split<CR>
nnoremap <Leader>wh :wincmd h<CR>
nnoremap <Leader>wl :wincmd l<CR>
nnoremap <Leader>wk :wincmd k<CR>
nnoremap <Leader>wj :wincmd j<CR>
nnoremap <Leader>w= :wincmd =<CR>
nnoremap <Leader>e :QuickRun<CR>
nnoremap <Leader>wb :e#<CR>
nnoremap <Leader>q :bd<CR>
nnoremap <Leader>c :bd!<CR>
nnoremap <Leader>ss :mksession! .vimsession<CR>
nnoremap <Leader>sr :so .vimsession<CR>
nnoremap <Leader><Leader>r :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>n :Vex!<CR>
"Buffer
nnoremap <Leader>tn :BufferNext<CR>
nnoremap <Leader>tp :BufferPrevious<CR>
nnoremap <Leader>1 :BufferGoto 1<CR>
nnoremap <Leader>2 :BufferGoto 2<CR>
nnoremap <Leader>3 :BufferGoto 3<CR>
nnoremap <Leader>4 :BufferGoto 4<CR>
nnoremap <Leader>5 :BufferGoto 5<CR>
nnoremap <Leader>6 :BufferGoto 6<CR>
nnoremap <Leader>7 :BufferGoto 7<CR>
nnoremap <Leader>8 :BufferGoto 8<CR>
nnoremap <Leader>9 :BufferLast<CR>

nnoremap - <c-o> " backup the C-o key

" Open terminal in the bottom split
map <Leader>aj :belowright 10split +term<CR>
" Open terminal
nnoremap <Leader>at :tabnew +term<CR>
" Floating terminal
nnoremap <Leader>ag :call FloatTerm()<CR>

nnoremap <silent> <Leader>pf <cmd>Telescope find_files theme=get_dropdown previewer=false<CR>
nnoremap <silent> <leader>f <cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h'), theme=get_dropdown, previewer=false, path_display= { 'absolute' } })<CR>
nnoremap <silent> <Leader>pb <cmd>Telescope buffers theme=get_dropdown<CR>
nnoremap <silent> <Leader>pr <cmd>Telescope oldfiles theme=get_dropdown previewer=false<CR>
nnoremap <silent> <Leader>gb <cmd>Telescope git_branches theme=get_dropdown previewer=false<CR>
nnoremap <silent> <Leader>gg <cmd>Git<CR>
nnoremap <silent> \ <cmd>Telescope live_grep theme=get_dropdown<CR>
nnoremap <silent> <c-o> <cmd>Telescope lsp_document_symbols theme=get_dropdown previewer=false<CR>

" Turn off whitespaces compare and folding in vimdiff
set splitright
silent! set splitvertical
set diffopt+=iwhite
set diffopt+=vertical
nnoremap <Leader><Leader>1 :diffget 1<CR>:diffupdate<CR>
nnoremap <Leader><Leader>2 :diffget 2<CR>:diffupdate<CR>

set clipboard=unnamedplus

function! DrawGitBranchInfo()
  let branch = fugitive#head()
  return len(branch) > 0 ? " " . branch : ""
endfunction

function! ShortenFileName()
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

function! GetProjectName()
  let name = finddir('.git/..', expand('%:p:h').';')
  let subs = split(name, "/")
  if len(subs) > 0
    return " " . subs[-1]
  else
    return ""
  endif
endfunction

function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif
  return ''
endfunction

au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * call s:disable_statusline('NvimTree')
fun! s:disable_statusline(bn)
   if a:bn == bufname('%')
     setlocal statusline=%#NonText#
     setlocal cursorline
   else
     setlocal nocursorline
     setlocal statusline=%#NonText#\ %{ShortenFileName()}
     setlocal statusline+=%=
     setlocal statusline+=\ %{LspStatus()}
     setlocal statusline+=\ %l:%c\ %{DrawGitBranchInfo()}\ %{GetProjectName()}
   endif
endfunction


" color lemontree-dark
color hiccup

set shortmess+=c
set signcolumn=yes

let g:vim_jsx_pretty_template_tags = ['html', 'jsx', 'tsx']

set termguicolors " this variable must be enabled for colors to be applied properly

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

if !(has('gui_vimr'))
  highlight SignColumn guibg=NONE
  highlight VertSplit guibg=NONE
  highlight LineNr guibg=NONE
endif

highlight EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
highlight NonText guifg=#677574 guibg=NONE
" highlight MatchParen guibg=#333a45 gui=NONE
highlight LspDiagnosticsDefaultHint guifg=#677674
highlight IndentBlanklineChar guifg=#3a4242
highlight NvimTreeIndentMarker guifg=#3a4242
highlight FloatBorder guibg=#222d2e guifg=#FFFFFF
highlight NormalFloat guibg=#222d2e
highlight BufferTabpageFill guibg=#181e24
highlight LspDiagnosticsUnderlineError cterm=undercurl gui=undercurl
highlight LspDiagnosticsUnderlineHint cterm=undercurl gui=undercurl
highlight LspDiagnosticsUnderlineWarning cterm=undercurl gui=undercurl
highlight LspDiagnosticsUnderlineInformation cterm=undercurl gui=undercurl

" LSP Config
lua << EOF

local nvim_lsp = require('lspconfig')

-- LSP Status
local lsp_status = require('lsp-status')
lsp_status.register_progress()

lsp_status.config({
  spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
  status_symbol = ''
})

-- LSP Config

local border = {
  {"╭", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╮", "FloatBorder"},
  {"│", "FloatBorder"},
  {"╯", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╰", "FloatBorder"},
  {"│", "FloatBorder"},
}

function PrintDiagnostics(opts, bufnr, line_nr, client_id)
  opts = opts or {}

  bufnr = bufnr or 0
  line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)

  local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr, line_nr, opts, client_id)
  if vim.tbl_isempty(line_diagnostics) then return end

  local diagnostic_message = ""
  for i, diagnostic in ipairs(line_diagnostics) do
    diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
    if i ~= #line_diagnostics then
      diagnostic_message = diagnostic_message .. "\n"
    end
  end
  --print only shows a single line, echo blocks requiring enter, pick your poison
  print(diagnostic_message)
end

local on_attach = function(client, bufnr)
  vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
  vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border})

  local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
  for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  vim.o.updatetime = 250
  vim.cmd [[ autocmd CursorHold,CursorHoldI * lua PrintDiagnostics() ]]

  lsp_status.on_attach(client, bufnr)
end

local lsp_installer = require'nvim-lsp-installer'
lsp_installer.on_server_ready(function(server)
  local caps = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  caps = vim.tbl_deep_extend('keep', caps, lsp_status.capabilities)
  local opts = {
    on_attach = on_attach,
    capabilities = caps
  }
  server:setup(opts)
end)

-- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

        -- For `luasnip` user.
        -- require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping.select_next_item(),
    },
    sources = {
      { name = 'vsnip' },
      { name = 'nvim_lsp' },
      { name = 'buffer' },
    }
  })

-- Treesitter

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = { "html" },
  },
  matchup = {
    enable = true,
    disable = { "html" }
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "typescript",
    "toml",
    "rust",
    "json",
    "yaml",
    "html",
    "scss",
    "go"
  },
}

-- Rust setup
require('rust-tools').setup({})

-- Indent guide with blank line support
require("indent_blankline").setup {
    char = "│",
    buftype_exclude = {"terminal"}
}

-- Telescope Config
local actions = require('telescope.actions')
require('telescope').setup{
defaults = {
  vimgrep_arguments = {
    "rg",
    "--color=never",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
    "--smart-case",
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "smart" },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
        },
      }
  }
}
require('telescope').load_extension('fzf')

-- nvim-comment
require('nvim_comment').setup()

-- surround
require("surround").setup{}

-- autopairs
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt", "vim", "html" }
})

-- gitsigns
require('gitsigns').setup{}

-- go
require('go').setup()

EOF

nnoremap <silent> ga <cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<CR>
vnoremap <silent> ga :<C-U><cmd>lua require('telescope.builtin').lsp_range_code_actions(require('telescope.themes').get_cursor())<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> ]e <cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = "single"}})<CR>
nnoremap <silent> [e <cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = "single"}})<CR>

