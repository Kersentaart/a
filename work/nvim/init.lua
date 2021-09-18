--[[
  ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
  ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
  ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
  ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
  ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
Neovim init file
--]]

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
require('plugins/packer')                 -- plugin manager
require('settings')                       -- settings
require('keymappings')                    -- keymaps

require('plugins/bufferline')             -- bufferline
require('plugins/lualine')                -- statusline
require('plugins/nvim-compe')             -- autocomplete
require('plugins/nvim-lspconfig')         -- plugin manager
require('plugins/nvim-tree')              -- file explorer
require('plugins/nvim-treesitter')        -- syntax
