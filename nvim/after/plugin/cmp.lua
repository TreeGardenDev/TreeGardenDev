local cmp              = require "cmp"
local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end
get_bufnrs             = function()
    local buf = vim.api.nvim_get_current_buf()
    local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
    if byte_size > 1024 * 1024 then -- 1 Megabyte max
        return {}
    end
    return { buf }
end

cmp.setup({

    sources = {
        -- Copilot Source
        { name = "copilot",  group_index = 1 },
        -- Other Sources
        {
            name = 'buffer',
            group_index = 1,
            option = { keyword_pattern = [[\k\+]] }
        },
        { name = "nvim_lsp", group_index = 1 },
        { name = "path",     group_index = 2 },

    },
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible()
            --and has_words_before()
            then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm { select = false },
        --['<R>'] = cmp.mapping.confirm({ select = true }),
        ['<R>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
        --choose item selected with ctrl tab
    },
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
    experimental = {
        ghost_text = {
            hl_group = "LspCodeLens",
        },
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
