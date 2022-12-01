-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer
-- https://github.com/wbthomason/packer.nvim

vim.cmd [[packadd packer.nvim]]         -- load packer
local use = require('packer').use       -- import module with 'use' function

-- Add packages
-- for package info see: init.lua (Lua modules)
require('packer').startup(function()
  -- Settings
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'morhetz/gruvbox'

  -- QoL
  use 'tpope/vim-surround'
  use 'Yggdroot/indentLine'
  use 'jiangmiao/auto-pairs'
  use 'airblade/vim-gitgutter'
  use 'hrsh7th/nvim-compe'
  use 'tpope/vim-fugitive'

  -- Syntax / Highlighting
  use 'kovetskiy/sxhkd-vim'
  use 'nelsyeung/twig.vim'
  use 'sbdchd/neoformat'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Unfinished confs
  use 'ray-x/lsp_signature.nvim'
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }
  -- use 'glepnir/lspsaga.nvim'


  -- File / Folder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    }
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }
  use {
    'akinsho/bufferline.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }
end)
