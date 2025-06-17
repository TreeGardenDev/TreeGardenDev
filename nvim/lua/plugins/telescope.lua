return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-telescope/telescope-fzf-native.nvim', build = 'make',
        'nvim-lua/plenary.nvim'
    },
    extensions = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case"
    },
    config = function()
        require('telescope').setup({})
        require('telescope').load_extension('fzf')

        local telescope = require('telescope.builtin')
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        vim.keymap.set('n', '<C-n>', telescope.find_files, {})
        vim.keymap.set('n', '<C-p>', telescope.git_files, {})
        vim.api.nvim_set_keymap('n', '<leader>n', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>',
            { noremap = true, silent = true })
        vim.keymap.set('n', '<C-s>', function()
            telescope.grep_string({ search = vim.fn.input("Grep > ") });
        end)
    end
}
