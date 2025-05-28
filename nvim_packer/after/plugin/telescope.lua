local telescope= require('telescope.builtin')
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
---- To get fzf loaded and working with telescope, you need to call
---- load_extension, somewhere after setup function:
--require('telescope').load_extension('fzf')
--.setup{
--    pickers={
--        find_files={
--            hidden=true
--        }
--    }
--}
require ('telescope').load_extension('fzf')
--local telescope = require('telescope')
--nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>;
vim.keymap.set('n', '<C-n>', telescope.find_files, {})
vim.keymap.set('n', '<C-p>', telescope.git_files, {})
vim.api.nvim_set_keymap('n', '<leader>n', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<C-s>', function()
	telescope.grep_string({ search = vim.fn.input("Grep > ")});
end)
