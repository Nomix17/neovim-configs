require('packer').startup(function(use)
  use 'MeanderingProgrammer/render-markdown.nvim'
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

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      local status_ok, ts_config = pcall(require, 'nvim-treesitter.configs')
      if not status_ok then
        return
      end

      ts_config.setup {
        ensure_installed = { "lua", "vim", "vimdoc", "query" }, 
        highlight = { enable = true },
      }
    end
  }

  use 'karb94/neoscroll.nvim'

  -- LSP and Completion
  use 'neovim/nvim-lspconfig'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use 'Mofiqul/vscode.nvim'
end)

require('plugins.barbar')
require('plugins.ibl')
