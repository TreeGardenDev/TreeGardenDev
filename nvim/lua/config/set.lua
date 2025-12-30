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
vim.opt.updatetime = 50

vim.g.mapleader = " "
vim.g.undotree_SetFocusWhenToggle = 1

--wrap text
vim.opt.wrap = true


--vim.opt.completeopt = "menuone,noselect"
vim.cmd("set list")
vim.cmd("set listchars=eol:¬,tab:>·")
--set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
--set colorscheme
--vim.cmd("colorscheme kanagawa")
vim.lsp.inlay_hint.enable(true, { 0 })
