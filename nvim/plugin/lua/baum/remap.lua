vim.g.mapleader = " "
vim.opt.laststatus = 2
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.opt.termguicolors = true
vim.opt.list = true

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
--vim.keymap.set("n", "<C-d>", "<C-d>zz")
--vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("i", "<Alt>h", "<left>")
vim.keymap.set("i", "<Alt>j", "<down>")
vim.keymap.set("i", "<Alt>k", "<up>")
vim.keymap.set("i", "<Alt>l", "<right>")



vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.local/bin/tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>bf", "<cmd>%!xxd<CR>")
--vim.keymap.set("n", "O", "O<Esc>")
--vim.keymap.set("n", "o", "o<Esc>")

vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>")

--vim.keymap.set("n", "<leader>tn", "<cmd>lua newtabbuffersamefiletype()<CR>")
--end tab and buffer
--vim.keymap.set("n", "<leader>tc", "<cmd>q!<CR>")
vim.keymap.set("n", "<leader>tt", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<leader>tT", "<cmd>tabprev<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


--vim.keymap.set("n", "<leader><leader>", function()
--
--    vim.cmd("so")
--end)
