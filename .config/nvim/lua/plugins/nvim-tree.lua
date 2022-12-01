-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------

local g = vim.g

-- Plugin: nvim-tree
--- https://github.com/kyazdani42/nvim-tree.lua
g.nvim_tree_width = 25
g.nvim_tree_width_allow_resize  = 1


require'nvim-tree'.setup {
  open_on_setup = true,
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    mappings = {
      list = {
        { key = "s", action = "vsplit" }
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = true
    },
    special_files = {'README.md', 'Makefile', 'MAKEFILE'},
    highlight_git = true,
    icons = {
      show = {
        git = true,
        folder = true,
        file = true
      },
      glyphs = {
        default = "‣ "
      }
    },
  }
}

-- Keybindings are defined in `keymapping.lua`
--- See: `help NvimTree`
--- https://github.com/kyazdani42/nvim-tree.lua#keybindings
