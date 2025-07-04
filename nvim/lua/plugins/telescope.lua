return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require('telescope').setup({})
        require("telescope").load_extension('harpoon')

        local telescope = require('telescope.builtin')
        local harpoon = require("telescope").extensions.harpoon
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        vim.keymap.set('n', '<C-n>', telescope.find_files, {})
        vim.keymap.set('n', '<C-p>', telescope.git_files, {})
        vim.api.nvim_set_keymap('n', '<leader>n', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>',
            { noremap = true, silent = true })
        vim.keymap.set('n', '<C-s>', function()
            telescope.grep_string({ search = vim.fn.input("Grep > ") });
        end)
        vim.keymap.set('n', '<leader>h', harpoon.marks, {})
    end,
}
