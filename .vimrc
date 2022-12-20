set nocompatible              " be iMproved, required
filetype off                  " required
"

" set the runtime path to include Vundle and initialize
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

set number
set relativenumber
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
Plug 'tpope/vim-fugitive'

Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
" Make sure you use single quotes
Plug 'itchyny/vim-cursorword'
Plug 'bounceme/poppy.vim'
Plug 'OmniSharp/omnisharp-vim'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Unmanaged plugin (manually installed and updated)
Plug 'dmerejkowsky/vim-ale', {'branch':'master'}
Plug 'airblade/vim-gitgutter', {'branch':'master'}
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" Put your non-Plugin stuff after this line
let g:ale_fixers={'rust':'rustfmt'}
au! cursormoved * call PoppyInit()
syntax enable
filetype plugin indent on
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
                                      
