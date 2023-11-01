--convert top from vimscript to lua
--
--Path: vimtex.lua
-- let g:vimtex_view_general_viewer = 'zathura'
-- let g:vimtex_view_general_options = '--fork'
-- let g:vimtex_view_general_options_latexmk = '--fork'
-- let g:vimtex_view_general_options_zathura = '--fork'

vim.g.vimtex_compiler_method = 'latexmk'
--vim.g.vimtex_compiler_method = 'tectonic'
vim.g.vimtex_view_general_viewer = 'zathura'
--vim.g.vimtex_view_general_options = '--fork'
--vim.g.vimtex_view_general_options_latexmk = '--fork'
--vim.g.vimtex_view_general_options_zathura = '--fork'


--vim.keymap.set("n", "<leader>lc", "<cmd>TexlabBuild<CR><cmd>TexlabForward<CR>", {noremap = true, silent = true})
------open in zathura
vim.keymap.set("n", "<leader>c", "<cmd>VimtexCompile<CR>", {noremap = true, silent = true})
--vim.keymap.set("n", "<leader>o", "<cmd>VimtexView<CR>", {noremap = true, silent = true})
--vim.keymap.set("n", "<leader>lc", "<cmd>TexlabBuild<CR><cmd>TexlabForward<CR>", {noremap = true, silent = true})
