-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    --use 'MunifTanjim/nui.nvim'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    --use 'ThePrimeagen/lsp-debug-tools.nvim'
    use 'lvimuser/lsp-inlayhints.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use { "nvim-telescope/telescope.nvim",
        requires = { { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } },
    }
    --use {
    --    'nvim-telescope/telescope.nvim',
    --    -- or                            , branch = '0.1.x',
    --    requires = { { 'nvim-lua/plenary.nvim' }}
    --}
    use 'lervag/vimtex'
    use('nvim-lua/plenary.nvim')
    use 'ThePrimeagen/harpoon'
    use('mbbill/undotree')
    use('CopilotC-Nvim/CopilotChat.nvim')
    -- optional for floating window border decoration
    use { "zbirenbaum/copilot.lua" }
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },                  -- Required
            { 'hrsh7th/cmp-nvim-lsp' },              -- Required
            { 'L3MON4D3/LuaSnip' },                  -- Required
        }
    }
end)
