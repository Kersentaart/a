-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd     				-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local fn = vim.fn       				-- call Vim functions
local g = vim.g         				-- global variables
local opt = vim.opt         		-- global/buffer/windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.encoding = 'UTF-8'
opt.wildmode = {'list', 'longest'}  -- Command-line completion mode
opt.wildignore = '*/node_modules/*,*/coverage/*,*/bower_components/*,*.so,*.swp,*.zip'

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true             -- show line number
opt.linespace = 3             -- space between lines
opt.cursorline = true         -- highlight current line
opt.relativenumber = true     -- show relative number
opt.showmatch = true          -- highlight matching parenthesis
opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
-- opt.colorcolumn = '300'        -- line lenght marker at 80 columns
opt.splitright = true         -- vertical split to the right
opt.splitbelow = true         -- orizontal split to the bottom
opt.ignorecase = true         -- ignore case letters when search
opt.smartcase = true          -- ignore lowercase for the whole pattern
opt.scrolloff = 8
-- opt.sidescrolloff = 15
-- opt.sidescroll = 1

-- Prettier on save
cmd[[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]]

-- remove whitespace on save
cmd[[au BufWritePre * :%s/\s\+$//e]]

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true         -- enable background buffers
opt.history = 100         -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
-- opt.synmaxcol = 80       -- max column for syntax highlight

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.termguicolors = true      -- enable 24-bit RGB colors
cmd 'colorscheme gruvbox'
-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 2        -- shift 4 spaces when tab
opt.tabstop = 2           -- 1 tab == 2 spaces
opt.smartindent = true    -- autoindent new lines
g.neoformat_try_node_exe = 1

-- IndentLine
--g.indentLine_setColors = 0  -- set indentLine color
g.indentLine_char = '┊'       -- set indentLine character

-- disable IndentLine for markdown files (avoid concealing)
cmd[[autocmd FileType markdown let g:indentLine_enabled=0]]

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
opt.completeopt = 'menuone,noselect,noinsert' -- completion options
--opt.shortmess = 'c' 	-- don't show completion messages
