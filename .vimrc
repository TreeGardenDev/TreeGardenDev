  1 set nocompatible              " be iMproved, required
  2 filetype off                  " required
  3 "
  4 
  5 " set the runtime path to include Vundle and initialize
  6 filetype plugin indent on    " required
  7 " To ignore plugin indent changes, instead use:
  8 "filetype plugin on
  9 "
 10 " Brief help
 11 " :PluginList       - lists configured plugins
 12 " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
 13 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 14 " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
 15 "
 16 " see :h vundle for more details or wiki for FAQ
 17 
 18 set number
 19 
 20 call plug#begin()
 21 " The default plugin directory will be as follows:
 22 "   - Vim (Linux/macOS): '~/.vim/plugged'
 23 "   - Vim (Windows): '~/vimfiles/plugged'
 24 "   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
 25 " You can specify a custom plugin directory by passing it as the argument
 26 "   - e.g. `call plug#begin('~/.vim/plugged')`
 27 "   - Avoid using standard Vim directory names like 'plugin'
 28 Plug 'tpope/vim-fugitive'
 29 
 30 Plug 'rust-lang/rust.vim'
 31 Plug 'preservim/nerdtree'
 32 Plug 'morhetz/gruvbox'
 33 " Make sure you use single quotes
 34 Plug 'itchyny/vim-cursorword'
 35 Plug 'bounceme/poppy.vim'
 36 Plug 'OmniSharp/omnisharp-vim'
 37 " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
 38 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 39 " Unmanaged plugin (manually installed and updated)
 40 Plug 'dmerejkowsky/vim-ale', {'branch':'master'}
 41 Plug 'airblade/vim-gitgutter', {'branch':'master'}
 42 " Initialize plugin system
 43 " - Automatically executes `filetype plugin indent on` and `syntax enable`.
 44 call plug#end()
 45 " Put your non-Plugin stuff after this line
 46 let g:ale_fixers={'rust':'rustfmt'}
 47 au! cursormoved * call PoppyInit()
 48 syntax enable
 49 filetype plugin indent on
 50 colorscheme gruvbox
 51 hi Normal guibg=NONE ctermbg=NONE
~                                                                                                                                                                                            
~                                               
