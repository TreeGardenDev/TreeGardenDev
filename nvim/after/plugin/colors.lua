vim.opt.termguicolors = true
vim.opt.list = true
function ReadAlacrittyColorscheme()
    local config_file = '/home/baum/.config/alacritty/alacritty.yml';
    local pattern = '[*]light'
    local handle = io.popen('rg "' .. pattern .. '" ' .. config_file);
    local result = handle:read("*a");
    handle:close()
    local match = string.match(result, pattern)
    if match then
        vim.cmd 'colorscheme delek'
    else
        vim.cmd 'colorscheme slate'
    end
end

vim.cmd 'autocmd VimEnter * lua ReadAlacrittyColorscheme()';

vim.keymap.set("n", "<C-b>",
    "<cmd>!/home/baum/.config/alacritty/alacritty_colorscheme.py <CR><cmd>lua ReadAlacrittyColorscheme()<CR>")
