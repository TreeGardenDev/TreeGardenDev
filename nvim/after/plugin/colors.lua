local material = require 'material'
local colors = require 'material.colors'

-- setup must be called before loading
material.setup{
    custom_highlights = {
        LineNr = { fg = '#cccccc' }
    },
    high_visibility = {
        lighter = true, -- Enable higher contrast text for lighter style
        darker = true-- Enable higher contrast text for darker style
    },
}

function readAlacrittyColorscheme()
    local config_file = '/home/baum/.config/alacritty/alacritty.yml';
    local pattern = '[*]light'
    local handle = io.popen('rg "' .. pattern .. '" ' .. config_file);
    local result = handle:read("*a");
    handle:close()
    local match = string.match(result, pattern)
    if match then
        vim.g.material_style = "lighter"
        vim.cmd 'colorscheme material'
    else
        vim.g.material_style = "deep ocean"
        vim.cmd 'colorscheme material'
    end
end

vim.cmd 'autocmd VimEnter * lua readAlacrittyColorscheme()';

vim.keymap.set("n", "<C-b>", "<cmd>!/home/baum/.config/alacritty/alacritty_colorscheme.py <CR> <cmd>lua readAlacrittyColorscheme()<CR>")


--vim.cmd('autocmd ColorScheme * if g:Alacritty_Colorscheme == "*dark" then colorscheme material else colorscheme catppuccin end');
--vim.keymap.set("n", "<leader>cl", "<cmd>material_style=\"lighter\"<CR>");
--vim.keymap.set("n", "<leader>cd", "<cmd>colorscheme material<CR>");

