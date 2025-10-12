require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'catppuccin/nvim'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'ap/vim-css-color'
  use 'rafi/awesome-vim-colorschemes'
  use 'nvim-tree/nvim-web-devicons'
  use 'lewis6991/gitsigns.nvim'
  use 'terryma/vim-multiple-cursors'
  use 'ryanoasis/vim-devicons'
  use 'mg979/vim-visual-multi'
  use 'romgrk/barbar.nvim'
  -- use 'preservim/nerdtree'
  use 'nvim-tree/nvim-tree.lua'
  use 'rainglow/vim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

  use 'neovim/nvim-lspconfig'
  use 'L3MON4D3/LuaSnip'
  use {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = { 'L3MON4D3/LuaSnip' }
  }
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }

end)

require('plugins.barbar')
require('plugins.ibl')

