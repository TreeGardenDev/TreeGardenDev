vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 20
local telescope = require ('telescope.builtin')
vim.opt.updatetime = 50

vim.g.mapleader = " "

--vim.opt.completeopt = "menuone,noselect"
vim.cmd("set list")
vim.cmd("set listchars=eol:¬,tab:>·")
--set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
--set colorscheme
--vim.cmd("colorscheme kanagawa")
vim.lsp.inlay_hint.enable(true, {0})

vim.keymap.set('n', '<C-n>', telescope.find_files, {})
vim.keymap.set('n', '<C-p>', telescope.git_files, {})
vim.api.nvim_set_keymap('n', '<leader>n', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<C-s>', function()
	telescope.grep_string({ search = vim.fn.input("Grep > ")});
end)
