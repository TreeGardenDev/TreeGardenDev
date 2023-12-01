local import_luasnip, luasnip = pcall(require, 'luasnip')
if not import_luasnip then return end
local cmp              = require "cmp"
local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end
-- gray
vim.cmd [[ hi Pmenu guibg=#191e29 ]] vim.cmd [[ hi PmenuSel guibg=#2f394f ]]
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#808080' })
-- blue
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
-- light blue
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
-- pink
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
-- front
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })
--cmp.mapping.preset.insert({
--    ['<R>'] = cmp.mapping.complete(),
--})
vim.o.completeopt      = 'menuone,noselect'
cmp.setup({

    sources = {
        -- Copilot Source
        { name = "copilot",  group_index = 2 },
        -- Other Sources
        { name = "nvim_lsp", group_index = 2 },
        {
            name = 'buffer',
            group_index = 2,
            option = { keyword_pattern = [[\k\+]] }
        },
        { name = "path", group_index = 2 },

    },
    mapping = {
        --["<Tab>"] = cmp.mapping(function(fallback)
        --    if cmp.visible() and has_words_before()
        --    then
        --        cmp.select_next_item()
        --    elseif luasnip.expand_or_jumpable() then
        --        luasnip.expand_or_jump()
        --    else
        --        fallback()
        --    end
        --end, { "i", "s" }),
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

        --['<R>'] = vim.schedule_wrap(function(fallback)
        --    if cmp.visible() and has_words_before() then
        --        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        --    else
        --        fallback()
        --    end
        --end),
        --["<S-Tab>"] = cmp.mapping(function(fallback)
        --    if cmp.visible() and has_words_before()
        --    then
        --        cmp.select_prev_item()
        --    elseif luasnip.jumpable(-1) then
        --        luasnip.jump(-1)
        --    else
        --        fallback()
        --    end
        --end, { "i", "s" }),
        --["<Tab>"] = cmp.mapping(function(fallback)
        --    if cmp.visible() --and has_words_before()
        --        and cmp.get_active_entry()
        --    then
        --        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        --    else
        --        fallback()
        --    end
        --end),
        --["<S-Tab>"] = cmp.mapping(function(fallback)
        --    if cmp.visible() --and has_words_before()
        --        and cmp.get_active_entry()
        --    then
        --        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        --    else
        --        fallback()
        --    end
        --end),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        --['<CR>'] = cmp.mapping.confirm { select = false },
        --['<CR>'] = cmp.mapping.confirm({
        --    behavior = cmp.ConfirmBehavior.Insert,
        --    select = false,
        --}),
        ['<CR>'] = cmp.mapping.confirm({
            -- documentation says this is important.
            -- I don't know why.
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),
        --['<R>'] = cmp.mapping.confirm( behavior = cmp.Confirm
        --Behavior.Replace,{ select = true }),
        ['<R>'] = cmp.mapping.confirm({ select = true }),
        --choose item selected with ctrl tab
    },
    sorting = {
        priority_weight = 2,
        comparators = {
            --require("copilot_cmp.comparators").prioritize,

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
    experimental = {
        --ghost_text = {
        --    hl_group = "LspCodeLens",
        --},
        asynchronous = true,
    },



})

-- cmp.lua
--local lspkind = require("lspkind")
--lspkind.init({
--  symbol_map = {
--    Copilot = "",
--  },
--})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
vim.api.nvim_set_hl(0, "CmpItemKindCopilotSnippet", { fg = "#6CC644" })
