vim.opt.termguicolors = true
vim.opt.list = true
--read env variable
--
Current=""
function ReadColorscheme()
    local environ=os.getenv("scheme")

    environ = tostring(environ)
    local pattern = "day"
    local match = string.match(environ, pattern)
    if match then
        vim.cmd 'colorscheme delek'
        Current="day"
    else
        vim.cmd 'colorscheme slate'
        Current="night"
    end
end

--vim.cmd 'autocmd VimEnter * lua ReadColorscheme()';

--vim.keymap.set("n", "<C-b>",
--    "<cmd>!/home/baum/.config/fish/functions/changescheme.sh <CR><cmd>lua ReadColorscheme()<CR>")
