-----------------------------------------------------------
-- Telescope configuration file
-----------------------------------------------------------

-- Plugin: telescope.nvim
-- https://github.com/nvim-telescope/telescope.nvim

require'telescope'.setup {
  defaults = {
    layout_config = {
      horizontal = {
        width = 0.9,
      }
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
  },
}
