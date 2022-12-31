set nocompatible              " be iMproved, required
autocmd VimEnter * NERDTree
filetype off                  " required

filetype plugin on
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
Plug 'rhysd/vim-clang-format'
Plug 'cdelledonne/vim-cmake'
Plug 'embear/vim-uncrustify'
Plug 'github/copilot.vim'
Plug 'OmniSharp/omnisharp-roslyn'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
"Plug 'altercation/vim-colors-solarized'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdtree'
Plug 'gruvbox-community/gruvbox'
"Plug 'davidhalter/jedi-vim'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'itchyny/vim-cursorword'
Plug 'cpiger/NeoDebug'
Plug 'bounceme/poppy.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dmerejkowsky/vim-ale', {'branch':'master'}
Plug 'airblade/vim-gitgutter', {'branch':'master'}
call plug#end()
" Put your non-Plugin stuff after this line
au FileType cs set omnifunc=syntaxcomplete#Complete
au FileType cs set foldmethod=marker
au FileType cs set foldmarker={,}
au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
au FileType cs set foldlevelstart=2  
let g:ale_fixers={'rust':'rustfmt'}
let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_colors= 'dark0'
au! cursormoved * call PoppyInit()
"let NERDTreeShowHidden=1
syntax enable
filetype plugin indent on
"hi Normal guibg=NONE ctermbg=NONE
set background=dark
colorscheme gruvbox
"colorscheme solarized
