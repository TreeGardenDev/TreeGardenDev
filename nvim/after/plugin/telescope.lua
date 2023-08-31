local telescope= require('telescope.builtin')
--.setup{
--    pickers={
--        find_files={
--            hidden=true
--        }
--    }
--}
vim.keymap.set('n', '<C-n>', telescope.find_files, {})
vim.keymap.set('n', '<C-p>', telescope.git_files, {})
vim.api.nvim_set_keymap('n', '<leader>n', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<C-s>', function()
	telescope.grep_string({ search = vim.fn.input("Grep > ")});
end)
