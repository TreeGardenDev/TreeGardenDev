local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end
return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        opts = {},
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            vim.o.completeopt = 'menuone,noselect'
            cmp.setup({
                sources = {
                    { name = "copilot",  group_index = 2 },
                    { name = 'luasnip', group_index= 2,  option = { use_show_condition = false } },
                    { name = "nvim_lsp", group_index = 2 },
                    {
                        name = 'buffer',
                        group_index = 2,
                        option = { keyword_pattern = [[\k\+]] }
                    },
                    { name = "path", group_index = 2 },

                },
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = vim.schedule_wrap(function(fallback)
                        if cmp.visible() and has_words_before() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                        else
                            fallback()
                        end
                    end),

                    ["<S-Tab>"] = vim.schedule_wrap(function(fallback)
                        if cmp.visible() and has_words_before() then
                            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                        else
                            fallback()
                        end
                    end),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    }),
                    ['<R>'] = cmp.mapping.confirm({ select = true }),

                }),
                sorting = {
                    priority_weight = 2,
                    comparators = {
                        require("copilot_cmp.comparators").prioritize,
                        -- Below is the default comparitor list and order for nvim-cmp
                        cmp.config.compare.offset,
                        -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
                        cmp.config.compare.exact,
                        cmp.config.compare.score,
                        cmp.config.compare.recently_used,
                        cmp.config.compare.locality,
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        init = function()
            -- Reserve a space in the gutter
            -- This will avoid an annoying layout shift in the screen
            vim.opt.signcolumn = 'yes'
        end,
        config = function()
            local lsp_defaults = require('lspconfig').util.default_config
            -- Add cmp_nvim_lsp capabilities settings to lspconfig
            -- This should be executed before you configure any language server
            lsp_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lsp_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )
            -- LspAttach is where you enable features that only work
            -- if there is a language server active in the file
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf }
                    vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
                    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                    vim.keymap.set("n", "<leader>er", function() vim.diagnostic.open_float() end, opts)
                    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
                    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
                    vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
                    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
                    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
                    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation)
                    vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover)
                    --vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
                    vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format() end, opts)
                    vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
                    vim.api.nvim_set_hl(0, "CmpItemKindCopilotSnippet", { fg = "#6CC644" })
                    --if language is c autoformat
                    if vim.bo[event.buf].filetype == 'c' or vim.bo[event.buf].filetype == 'py' then
                        vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

                    end
                end,
            })

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                    --dart
                    dartls = function()
                        require('lspconfig').dartls.setup({
                            force = true,
                        })
                    end,
                }
            })
        end,

            
    }
}
