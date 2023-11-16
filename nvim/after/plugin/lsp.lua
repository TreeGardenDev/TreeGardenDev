local lsp = require("lsp-zero")


require("lsp-inlayhints").setup({
    inlay_hints = {
        highlight = "Comment",
        prefix = " > ",
        aligned = false,
        only_current_line = false,
        enabled = { "TypeHint", "ChainingHint", "ParameterHint" },
    },
})
--local lspconfig = require("lspconfig")

--lsp.preset("recommended")
lsp.preset({})
lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
})
lsp.setup_servers({'dartls', force = true})
--setup web assembly lsp
--lsp.setup_servers({'wasm-language-server', force = true})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

--local cmp = require('cmp')
--local cmp_select = { behavior = cmp.SelectBehavior.Insert }
--local cmp_mappings = lsp.defaults.cmp_mappings({
--    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--    ['<C-Return>'] = cmp.mapping.confirm({ select = true }),
--    ["<C-Space>"] = cmp.mapping.complete(),
--    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
--    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
--
--
--})
--
----cmp_mappings['<Tab>'] = nil
----cmp_mappings['<S-Tab>'] = nil
--
--lsp.setup_nvim_cmp({
--    mapping = cmp_mappings
--})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

--})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    --end)
    --     },
    -- })

    require("lsp-inlayhints").on_attach(client, bufnr)
    vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>er", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.rename() end, opts)
    --vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format() end, opts)
end)

--vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

lsp.setup()

--
--if filetype ==wat or wasm
--vim.lsp.start({
--  name = 'wasm_lsp',   -- No idea whether this should be "more unique" 🤷
--  cmd = {'wasm-lsp'},
--  root_dir = '~/git/wasm-lsp-server/'
--})
