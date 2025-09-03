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
vim.keymap.set("n", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("i", "<Alt>h", "<left>")
vim.keymap.set("i", "<Alt>j", "<down>")
vim.keymap.set("i", "<Alt>k", "<up>")
vim.keymap.set("i", "<Alt>l", "<right>")
vim.g.copilot_assume_mapped = true 


vim.keymap.set('n', "<leader>ga", "<cmd>silent !git add %<CR>")
vim.keymap.set('n', "<leader>gg", "<cmd>silent !git add .<CR>")
vim.keymap.set('n',"<leader>gc", function()
  local message = vim.fn.input("Commit message: ")
  if message ~= "" then
    vim.cmd("silent !git commit -m '" .. message .. "'")
    print("Committed with message: " .. message)
  else
    print("Commit message cannot be empty.")
  end
end)
vim.keymap.set('n',"<leader>gp", function()
    local remote=vim.fn.input("Remote name (default 'origin'): ")
    if remote == "" then
        remote = "origin"
    end
    local branch=vim.fn.input("Branch name: ")
    if branch ~= "" then
        vim.cmd("silent !git push " .. remote .. " " .. branch)
        print("Pushed to " .. remote .. "/" .. branch)
    else
        print("Branch name cannot be empty.")
    end
end)
vim.keymap.set('n',"<leader>gq", function()
    local remote=vim.fn.input("Remote name (default 'origin'): ")
    if remote == "" then
        remote = "origin"
    end
    local branch=vim.fn.input("Branch name: ")
    if branch ~= "" then
        vim.cmd("silent !git pull" .. remote .. " " .. branch)
        print("Pulled from " .. remote .. "/" .. branch)
    else
        print("Branch name cannot be empty.")
    end
end)

vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new ~/.local/bin/tmux-sessionizer<CR>")
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

