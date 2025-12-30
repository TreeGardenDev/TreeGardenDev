return
{
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = function () require("copilot_cmp").setup() end,
    dependencies = {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      config = function()
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
        });
              --  vim.cmd("Copilot disable")
      end,
    },
        --vim.keymap.set("n", "<leader>co", ":Copilot enable<CR>", { noremap = true, silent = true }),
        --vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { noremap = true, silent = true }),

}


