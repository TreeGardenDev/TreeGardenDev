-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    --use 'MunifTanjim/nui.nvim'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'ThePrimeagen/lsp-debug-tools.nvim'
    use 'lvimuser/lsp-inlayhints.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
       --use({
    --    "L3MON4D3/LuaSnip",
    --    -- follow latest release.
    --    tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    --    -- install jsregexp (optional!:).
    --    run = "make install_jsregexp"
    --})
    --use({
    --    "Bryley/neoai.nvim",
    --    require = { "MunifTanjim/nui.nvim" },
    --    cmd = {
    --        "NeoAI",
    --        "NeoAIOpen",
    --        "NeoAIClose",
    --        "NeoAIToggle",
    --        "NeoAIContext",
    --        "NeoAIContextOpen",
    --        "NeoAIContextClose",
    --        "NeoAIInject",
    --        "NeoAIInjectCode",
    --        "NeoAIInjectContext",
    --        "NeoAIInjectContextCode",
    --    },
    --    config = function()
    --        require("neoai").setup({
    --            ui = {
    --                output_popup_text = "NeoAI",
    --                input_popup_text = "Prompt",
    --                width = 30,               -- As percentage eg. 30%
    --                output_popup_height = 80, -- As percentage eg. 80%
    --                submit = "<Enter>",       -- Key binding to submit the prompt
    --            },
    --            models = {
    --                {
    --                    name = "openai",
    --                    model = "gpt-3.5-turbo-16k",
    --                    params = nil,
    --                },
    --            },
    --            register_output = {
    --                ["g"] = function(output)
    --                    return output
    --                end,
    --                ["c"] = require("neoai.utils").extract_code_snippets,
    --            },
    --            inject = {
    --                cutoff_width = 75,
    --            },
    --            mappings = {
    --                ["select_up"] = "<C-k>",
    --                ["select_down"] = "<C-j>",
    --            },
    --            open_ai = {
    --                api_key = {
    --                    env = "OPENAI_API_KEY",
    --                    value = nil,
    --                },
    --            },
    --            shortcuts = {
    --                {
    --                    name = "textify",
    --                    key = "<leader>as",
    --                    desc = "fix text with AI",
    --                    use_context = true,
    --                    prompt = [[
    --            Please rewrite the text to make it more readable, clear,
    --            concise, and fix any grammatical, punctuation, or spelling
    --            errors
    --        ]],
    --                    modes = { "v" },
    --                    strip_function = nil,
    --                },
    --                {
    --                    name = "gitcommit",
    --                    key = "<leader>ag",
    --                    desc = "generate git commit message",
    --                    use_context = false,
    --                    prompt = function()
    --                        return [[
    --                Using the following git diff generate a consise and
    --                clear git commit message, with a short title summary
    --                that is 75 characters or less:
    --            ]] .. vim.fn.system("git diff --cached")
    --                    end,
    --                    modes = { "n" },
    --                    strip_function = nil,
    --                },
    --            },
    --        })
    --    end,
    --})
    use {
        'nvim-telescope/telescope.nvim',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' },
        {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}}
    }
    use 'lervag/vimtex'
    use('nvim-lua/plenary.nvim')
    use 'ThePrimeagen/harpoon'
    use('mbbill/undotree')
    --
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
    --use 'neovim/nvim-lspconfig'
    --use {
    --      "neovim/nvim-lspconfig",
    --      opt = true,
    --      event = { "BufReadPre" },
    --      wants = {
    --        "inlay-hints.nvim",
    --      },
    --      config = function()
    --        require("config.lsp").setup()
    --      end,
    --      requires = {
    --        {
    --          "simrat39/inlay-hints.nvim",
    --          config = function()
    --            require("inlay-hints").setup()
    --          end,
    --        },
    --      },
    --    }
    -- Debugging
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
end)
