
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
" =====
" === System
" =====
set wildmode=longest:full,full
set wildignore+=*/node_modules/*,*/coverage/*,*/bower_components/*,*.so,*.swp,*.zip
set autoread
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
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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
" ===== TODO
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l
tnoremap <Esc> <C-\><C-n>


" ===============
" === Plugins ===
" ===============
call plug#begin('~/.local/share/nvim/plugged')
" =====
" === Theme
" =====
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
" Plug 'rainglow/vim'
" === Statusline / tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" === Syntax highlighting and improved indentation
Plug 'pangloss/vim-javascript'
Plug 'burnettk/vim-angular'
Plug 'nelsyeung/twig.vim'
Plug 'jparise/vim-graphql'

" =====
" === Files management
" =====
"=== File system explorer
" === Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
" =====
" === Editor stuff
" =====
Plug 'sheerun/vim-polyglot'
" === Auto double quote/bracked
Plug 'jiangmiao/auto-pairs'
" === Put stuff around stuff
Plug 'tpope/vim-surround'
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
let g:ale_fix_on_save = 1


" =====
" === Fugitive (oneline)
" =====
let g:mta_use_matchparen_group = 1
" === Makes fugitive always have the root directory as repo url
set autochdir
nnoremap <silent> gs :Gstatus<CR>:10wincmd_<CR>


" =====



" =====
" === Coc
" =====
let g:coc_global_extensions = [ 'coc-tsserver' ]
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
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#formatter = 'default'
let g:airline_section_b = ''
let g:airline_section_y = ''
" let g:airline_section_z = ''
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
