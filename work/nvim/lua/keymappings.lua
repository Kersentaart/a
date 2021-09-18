--- Mappings
local function map(mode, lhs, rhs, opts) -- Keybinding map function
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local g = vim.g         				-- global variables

-- Easy edit
map('n', '<space>', '<S-:>')
map('i', 'jk', '<Esc>')

-- Scripts
map('n', '<leader><C-d>', 'viwy<S-:>%s/<C-r>"/')
map('n', '<A-m>', 'viwyoconsole.log("<Esc>pa", <Esc>pa);<Esc>')
map('n', '<A-,>', ':%s/console.log(".*);/<Enter>dd')

-- Buffers
map('n', 'gp', ':bp<CR>')
map('n', 'gn', ':bn<CR>')
map('n', 'gq', ':bp <BAR> bd #<CR>')

--- Window management
map('', '<A-k>', ':res +10<CR>')
map('', '<A-j>', ':res -10<CR>')
map('', '<A-h>', ':vertical resize-10<CR>')
map('', '<A-l>', ':vertical resize+10<CR>')
map('n', 'srv', '<C-w>b<C-w>H')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('t', '<C-h>', '<C-w>h')
map('t', '<C-j>', '<C-w>j')
map('t', '<C-k>', '<C-w>k')
map('t', '<C-l>', '<C-w>l')

--- Nvim tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts)
map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts)
map('n', '<A-r>', ':NvimTreeFindFile<cr>', default_opts)
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
g.nvim_tree_bindings = {
  { key = "s", cb = tree_cb("vsplit") },
}

-- Telescope
map('n', '<C-p>', '<cmd>Telescope find_files<cr>', { silent = true })
map('n', '<leader>f', '<cmd>Telescope live_grep<cr>', { silent = true })
map('n', 'gl', '<cmd>Telescope buffers<cr>', { silent = true })
map('n', ';;', '<cmd>Telescope help_tags<cr>', { silent = true })

-- Bufferline
map('n', 'gf', ':BufferLinePick<CR>', {silent = true })

-- compe
map('i', '<C-Space>', 'compe#complete()', {silent = true, expr = true })
map('i', '<Return>', 'compe#confirm("<CR>")', {silent = true, expr = true })
map('i', '<C-e>', 'compe#close("<C-e>")', {silent = true, expr = true })
