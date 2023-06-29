local material = require 'material'
local colors = require 'material.colors'
vim.g.material_style = "darker"
material.setup{
custom_highlights = {
        LineNr = { fg = '#cccccc' }
    }
}
vim.cmd 'colorscheme material'
