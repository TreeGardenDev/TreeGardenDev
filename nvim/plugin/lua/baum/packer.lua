-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  	use 'wbthomason/packer.nvim'
    use 'MunifTanjim/nui.nvim'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use ({
    "Bryley/neoai.nvim",
	require = { "MunifTanjim/nui.nvim" },
    cmd = {
        "NeoAI",
        "NeoAIOpen",
        "NeoAIClose",
        "NeoAIToggle",
        "NeoAIContext",
        "NeoAIContextOpen",
        "NeoAIContextClose",
        "NeoAIInject",
        "NeoAIInjectCode",
        "NeoAIInjectContext",
        "NeoAIInjectContextCode",
    },
    config = function()
        require("neoai").setup({
           ui = {
        output_popup_text = "NeoAI",
        input_popup_text = "Prompt",
        width = 30, -- As percentage eg. 30%
        output_popup_height = 80, -- As percentage eg. 80%
        submit = "<Enter>", -- Key binding to submit the prompt
    },
    models = {
        {
            name = "openai",
            model = "gpt-3.5-turbo",
            params = nil,
        },
    },
    register_output = {
        ["g"] = function(output)
            return output
        end,
        ["c"] = require("neoai.utils").extract_code_snippets,
    },
    inject = {
        cutoff_width = 75,
    },
    mappings = {
        ["select_up"] = "<C-k>",
        ["select_down"] = "<C-j>",
    },
    open_ai = {
        api_key = {
            env = "OPENAI_API_KEY",
            value = nil,
        },
    },
        })
    end,
    })
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
    use { "zbirenbaum/copilot.lua" }
    use {
        "zbirenbaum/copilot-cmp",
          after = { "copilot.lua" },
          config = function ()
            require("copilot_cmp").setup()
          end
        }
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
