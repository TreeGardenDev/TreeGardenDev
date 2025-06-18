return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("harpoon").setup({
            menu = {
                width = vim.api.nvim_win_get_width(0) - 4,
            },
        })
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        local tmux = require("harpoon.tmux")
        vim.keymap.set("n", "<leader>af", mark.add_file)
        vim.keymap.set("n", "<C-f>", ui.toggle_quick_menu)
        vim.keymap.set("n", "<leader>t", function()
            tmux.gotoTerminal(1) -- navigates to term 1
        end)
        vim.keymap.set("n", "<C-h>", ui.nav_prev)
        vim.keymap.set("n", "<C-l>", ui.nav_next)
    end,
}
