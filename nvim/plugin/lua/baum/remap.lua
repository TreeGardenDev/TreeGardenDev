vim.g.mapleader = " "
vim.opt.laststatus = 2
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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

function closetabandkillbuffer()
    --go to first tab
    local firsttab = 1
    --delete first line from file in first tab
    local firsttabname = vim.fn.bufname(firsttab)
end

function newtabbuffersamefiletype()
    local fileextension = vim.fn.expand("%:e")
    local buffercount = vim.fn.bufnr("$")

    local filetype = vim.bo.filetype
    --find lsp server for this filetype
    local lspbeingused = vim.lsp.get_active_clients()
    local lspbeingused = lspbeingused[2]
    --get client id
    local lspbeingused = lspbeingused.id
    --start lspbeingused in new tab
    --
    --
    --write into original file at the top
    --enter pub mod into file
    if fileextension == "rs" then
        vim.cmd("normal gg")
        vim.cmd("normal O")
        vim.cmd("normal ipub mod buffer" .. tostring(buffercount) .. ";")
    end
    local buffname = ""
    if fileextension == "rs" then
        buffname = "src/buffer" .. tostring(buffercount) .. "." .. fileextension
    else
        buffname = "buffer" .. tostring(buffercount) .. "." .. fileextension
    end

    --local buffname = "src/buffer" .. tostring(buffercount) .. "." .. fileextension
    vim.cmd("tabnew " .. buffname)
    local currbuffname = vim.fn.expand("%:t")
    local bufnr = vim.fn.bufnr("%")
    vim.lsp.buf_attach_client(bufnr, lspbeingused)
    --make the box with code option appear
    --
end

--vim.keymap.set("n", "<leader><leader>", function()
--
--    vim.cmd("so")
--end)
