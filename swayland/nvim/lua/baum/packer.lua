-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  	use 'wbthomason/packer.nvim'

	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	-- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
    use "lukas-reineke/indent-blankline.nvim"
	use 'marko-cerovac/material.nvim'
    use 'lervag/vimtex'
	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use ('nvim-treesitter/playground')
	use ('nvim-lua/plenary.nvim')
	use 'ThePrimeagen/harpoon'
	use ('mbbill/undotree')
	use ('tpope/vim-fugitive')
    -- nvim v0.7.2
        -- optional for floating window border decoration
      
	 use ('rust-lang/rust.vim')
	 use {
		  'VonHeikemen/lsp-zero.nvim',
		  branch = 'v2.x',
		  requires = {
		    -- LSP Support
		    {'neovim/nvim-lspconfig'},             -- Required
		    {                                      -- Optional
		      'williamboman/mason.nvim',
		      run = function()
		        pcall(vim.cmd, 'MasonUpdate')
		      end,
		    },
		    {'williamboman/mason-lspconfig.nvim'}, -- Optional
		    -- Autocompletion
		    {'hrsh7th/nvim-cmp'},     -- Required
		    {'hrsh7th/cmp-nvim-lsp'}, -- Required
		    {'L3MON4D3/LuaSnip'},     -- Required
		  }
	}
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'
    -- Debugging
    use 'mfussenegger/nvim-dap'
    use({
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
        "nvim-lua/plenary.nvim",
    },
})
  end)
