  1 set nocompatible              " be iMproved, required
  2 filetype off                  " required
  3 "
  4 
  5 " set the runtime path to include Vundle and initialize
  6 set rtp+=~/.vim/bundle/Vundle.vim
  7 call vundle#begin()
  8 " alternatively, pass a path where Vundle should install plugins
  9 "call vundle#begin('~/some/path/here')
 10 
 11 " let Vundle manage Vundle, required
 12 Plugin 'VundleVim/Vundle.vim'
 13 
 14 " The following are examples of different formats supported.
 15 " Keep Plugin commands between vundle#begin/end.
 16 " plugin on GitHub repo
 17 Plugin 'tpope/vim-fugitive'
 18 " plugin from http://vim-scripts.org/vim/scripts.html
 19 " Plugin 'L9'
 20 " Git plugin not hosted on GitHub
 21 Plugin 'git://git.wincent.com/command-t.git'
 22 " The sparkup vim script is in a subdirectory of this repo called vim.
 23 " Pass the path to set the runtimepath properly.
 24 Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 25 " Install L9 and avoid a Naming conflict if you've already installed a
 26 " different version somewhere else.
 27 " Plugin 'ascenator/L9', {'name': 'newL9'}
 28 Plugin 'Valloric/YouCompleteMe'
 29 Plugin 'projekt0n/github-nvim-theme'
 30 " All of your Plugins must be added before the following line
 31 call vundle#end()            " required
 32 filetype plugin indent on    " required
 33 " To ignore plugin indent changes, instead use:
 34 "filetype plugin on
 35 "
 36 " Brief help
 37 " :PluginList       - lists configured plugins
 38 " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
 39 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 40 " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
 41 "
 42 " see :h vundle for more details or wiki for FAQ
 43 
 44 set number
 45 
 46 call plug#begin()
 47 " The default plugin directory will be as follows:
 48 "   - Vim (Linux/macOS): '~/.vim/plugged'
 49 "   - Vim (Windows): '~/vimfiles/plugged'
 50 "   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
 51 " You can specify a custom plugin directory by passing it as the argument
 52 "   - e.g. `call plug#begin('~/.vim/plugged')`
 53 "   - Avoid using standard Vim directory names like 'plugin'
 54 Plug 'tpope/vim-fugitive'
 55 
 56 Plug 'rust-lang/rust.vim'
 57 Plug 'preservim/nerdtree'
 58 Plug 'morhetz/gruvbox'
 59 " Make sure you use single quotes
 60 Plug 'itchyny/vim-cursorword'
 61 Plug 'bounceme/poppy.vim'
 62 Plug 'OmniSharp/omnisharp-vim'
 63 " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
 64 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 65 " Unmanaged plugin (manually installed and updated)
 66 Plug 'dmerejkowsky/vim-ale', {'branch':'master'}
 67 Plug 'airblade/vim-gitgutter', {'branch':'master'}
 68 " Initialize plugin system
 69 " - Automatically executes `filetype plugin indent on` and `syntax enable`.
 70 call plug#end()
 71 " Put your non-Plugin stuff after this line
 72 let g:ale_fixers={'rust':'rustfmt'}
 73 au! cursormoved * call PoppyInit()
 74 syntax enable
 75 filetype plugin indent on
 76 colorscheme gruvbox
 77 hi Normal guibg=NONE ctermbg=NONE
~                                     
