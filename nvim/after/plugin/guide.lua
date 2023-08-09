vim.opt.termguicolors = true
vim.opt.list = true
--vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
--vim.g.show_current_context = true
--vim.g.show_current_context_start = true
vim.g.indent_blankline_show_current_context_start = true
--vim.cmd [[highlight IndentBlanklineContextChar guifg=#cccccc gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineContextStart guifg=#cccccc gui=underline]]
--vim.cmd [[highlight IndentBlanklineContextChar guifg=#cccccc gui=nocombine]]
--make another highlight group for space characters that are light grey
vim.cmd [[highlight IndentBlanklineSpaceChar guifg=#696969 gui=nocombine]]
--make a light offwhite color for indentline
vim.cmd [[highlight IndentBlanklineChar guifg=#cccccc gui=nocombine]]

vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
vim.g.indent_blankline_use_treesitter_scope = true
require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineSpaceChar"
    },
    space_char_highlight_list = {
        "IndentBlanklineSpaceChar",
    },
    show_current_context = true,
    show_current_context_start = true,
}
