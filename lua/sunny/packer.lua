-- This file can be loaded by calling `lua require('plugins')` from your init.vim


-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- colorscheme
  -- use "rebelot/kanagawa.nvim"
  use {
    "vague2k/vague.nvim",
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require("vague").setup({
        -- optional configuration here
      })
    end
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use {
	  "williamboman/mason.nvim"
  }

  use {
	  'williamboman/mason-lspconfig.nvim',
	  requires = { 'neovim/nvim-lspconfig' },
  }

  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/nvim-cmp')

  use('theprimeagen/harpoon')

  use {
	  "windwp/nvim-autopairs",
	  event = "InsertEnter",
	  config = function()
		  require("nvim-autopairs").setup {}
	  end
  }

  use {
	  "stevearc/conform.nvim",
	  opts = {
		  formatters_by_ft = {
			  javascript = { "prettier" },
			  javascriptreact = { "prettier" },
			  typescript = { "prettier" },
			  typescriptreact = { "prettier" },
		  },
	  },
  }

end)
