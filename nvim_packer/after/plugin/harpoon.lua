local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
--local term = require("harpoon.tmux")
require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
    },
})

vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

--require("telescope").load_extension('harpoon')
vim.keymap.set("n", "<leader>af", mark.add_file)
vim.keymap.set("n", "<C-f>", ui.toggle_quick_menu)


vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)

--vim.keymap.set("n", "<leader>t", function() term.gotoTerminal(0) end)

vim.keymap.set("n", "<leader>,", function() ui.nav_next() end)
vim.keymap.set("n", "<leader>.", function() ui.nav_prev() end)


