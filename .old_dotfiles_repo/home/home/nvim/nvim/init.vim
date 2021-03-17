
"  ___   __    _  ___   _______        __   __  ___   __   __
" |   | |  |  | ||   | |       |      |  | |  ||   | |  |_|  |
" |   | |   |_| ||   | |_     _|      |  |_|  ||   | |       |
" |   | |       ||   |   |   |        |       ||   | |       |
" |   | |  _    ||   |   |   |   ___  |       ||   | |       |
" |   | | | |   ||   |   |   |  |   |  |     | |   | | ||_|| |
" |___| |_|  |__||___|   |___|  |___|   |___|  |___| |_|   |_|
"
"  _______  __   __  _______  _______  _______  __   __
" |       ||  | |  ||       ||       ||       ||  |_|  |
" |  _____||  |_|  ||  _____||_     _||    ___||       |
" | |_____ |       || |_____   |   |  |   |___ |       |
" |_____  ||_     _||_____  |  |   |  |    ___||       |
"  _____| |  |   |   _____| |  |   |  |   |___ | ||_|| |
" |_______|  |___|  |_______|  |___|  |_______||_|   |_|
" === System / passive configuration


" =====
" === System
" =====
set wildmode=longest:full,full
set wildignore+=*/node_modules/*,*/coverage/*,*/bower_components/*,*.so,*.swp,*.zip
set autoread
" === Makes fugitive always have the root directory as repo url
set autochdir
let NERDTreeChDirMode=2
" === Easier search
set ignorecase
set smartcase
" === Copy paste
set clipboard=unnamedplus
" === Buffers
set hidden


" =====
" === Scrolling
" =====
" === Start scrolling when we're 8 lines away from margins
set scrolloff=8
set sidescrolloff=15
set sidescroll=1


" =====
" === TabDTreeAutoCenter=0
" =====
set tabstop=2
set shiftwidth=2
set expandtab


"  _______  ______   ___   _______  _______  ______
" |       ||      | |   | |       ||       ||    _ |
" |    ___||  _    ||   | |_     _||   _   ||   | ||
" |   |___ | | |   ||   |   |   |  |  | |  ||   |_||_
" |    ___|| |_|   ||   |   |   |  |  |_|  ||    __  |
" |   |___ |       ||   |   |   |  |       ||   |  | |
" |_______||______| |___|   |___|  |_______||___|  |_|
" === Editor keybindings and plugin configuration

" ==============
" === Macros ===
" ==============

" === Summon the great replace
nnoremap <leader><C-d> viwy<S-:>%s/<C-r>"/
" === Summon the great console log
map <A-m> viwyoconsole.log("jkpa", jkpa);jk
" === Desummon console.logs
map <A-,> :%s/console.log(".*);/<Enter>dd


" =========================
" === Custom keybinding ===
" =========================

map <Leader> <Plug>(easymotion-prefix)
" === Easy edit
imap jk <Esc>
nnoremap <Esc> <NOP>
noremap <space> <S-:>
" === Buffers
" Move to the previous buffer with "gp"
nnoremap gp :bp<CR>

" Move to the next buffer with "gn"
nnoremap gn :bn<CR>

" List all possible buffers with "gl"
nnoremap gl :ls<CR>
" Close buffer and move to previous
nmap gq :bp <BAR> bd #<CR>

" List all possible buffers with "gb" and accept a new buffer argument [1]
nnoremap gb :ls<CR>:b



" =====
" === "Window management
" =====
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
" map sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
" map sj :set splitbelow<CR>:split<CR>
" map sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
" map sl :set splitright<CR>:vsplit<CR>
" Resize splits
map <A-k> :res +10<CR>
map <A-j> :res -10<CR>
map <A-h> :vertical resize-10<CR>
map <A-l> :vertical resize+10<CR>
" === Rotate screens vertically
noremap srv <C-w>b<C-w>H


" =====
" === Easy split screen
" =====
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l
tnoremap <Esc> <C-\><C-n>


" =====
" === Tab management
" =====
" === Create a new tab with tu
map tn :tabe<CR>
" === Move the tabs with tmn and tmi
map tmb :-tabmove<CR>
map tmm :+tabmove<CR>
" === Close current tab
map tq :tabclose<CR>


" ===============
" === Plugins ===
" ===============
call plug#begin('~/.local/share/nvim/plugged')
" =====
" === Theme
" =====
Plug 'morhetz/gruvbox'
Plug 'crusoexia/vim-monokai'
" Plug 'rainglow/vim'
" === Statusline / tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" === Syntax highlighting and improved indentation
Plug 'pangloss/vim-javascript'
Plug 'burnettk/vim-angular'
Plug 'nelsyeung/twig.vim'
" =====
" === Files management
" =====
"=== File system explorer
Plug 'scrooloose/nerdtree'
" === Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
" =====
" === Editor stuff
" =====
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'sheerun/vim-polyglot'
" === Auto double quote/bracked
Plug 'jiangmiao/auto-pairs'
" === Put stuff around stuff
Plug 'tpope/vim-surround'
" === Easy movin around
Plug 'easymotion/vim-easymotion'
" === Auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" === prettier
Plug 'w0rp/ale'
" =====
" === Git stuff
" =====
" === Git file diff in gutter
Plug 'airblade/vim-gitgutter'
" === Easy git merge conflict solver // dgu, dg1; upstream/local version
Plug 'christoomey/vim-conflicted'
" === Git wrapper
Plug 'tpope/vim-fugitive'
" === sxhkd
Plug 'kovetskiy/sxhkd-vim'
call plug#end()

" =====
" === Ale Fix
" =====
let g:mta_use_matchparen_group = 1
" Eslint
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'


" =====
" === Fugitive (oneline)
" =====
let g:mta_use_matchparen_group = 1


" =====
" === Nerdtree
" =====
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
map <A-r> :NERDTreeFind<cr>
let g:NERDTreeWinPos = "left"



" =====
" === Coc
" =====
nmap <silent> gr <Plug>(coc-references)
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

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)


" =====
" === Fzf
" =====
let g:fzf_buffers_jump = 1
map <C-p> :GFiles<CR>
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" =====
" === Statusline / airline
" =====
"
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
let g:airline_theme="hybrid"
let g:airline_detect_modified=1
let g:airline_detect_paste=1
"let g:airline#extensions#nerdtree_status = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#formatter = 'default'
let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
" let g:airline_section_y = 'BN: ${bufnr("%")}'

let g:airline_mode_map = {
\ '__'     : '-',
\ 'c'      : 'C',
\ 'i'      : 'I',
\ 'ic'     : 'I',
\ 'ix'     : 'I',
\ 'n'      : 'N',
\ 'multi'  : 'M',
\ 'ni'     : 'N',
\ 'no'     : 'N',
\ 'R'      : 'R',
\ 'Rv'     : 'R',
\ 's'      : 'S',
\ 'S'      : 'S',
\ ''     : 'S',
\ 't'      : 'T',
\ 'v'      : 'V',
\ 'V'      : 'V',
\ ''     : 'V',
\ }

" =====
" === Theme
" =====
let g:gruvbox_italic=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax on
set termguicolors
colorscheme gruvbox
set number
set linespace=3
set guifont=Fira\ Code:h12
set cursorline
set relativenumber
set background=dark
" let g:javascript_plugin_jwoc = 1


" =====
" === Markdown
" =====

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
