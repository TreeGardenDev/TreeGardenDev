--convert top from vimscript to lua
--
--Path: vimtex.lua

vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_view_general_viewer = 'zathura'


vim.keymap.set("n", "<leader>c", "<cmd>VimtexCompile<CR>", {noremap = true, silent = true})
