-----------------------------------------------------------
-- Treesitter configuration file
-----------------------------------------------------------

-- Plugin: nvim-treesitter
--- https://github.com/nvim-treesitter/nvim-treesitter

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "typescript",
    "javascript",
    "tsx",
    "toml",
    "json",
    "yaml",
    "html",
    "scss",
    "css"
  },
}
