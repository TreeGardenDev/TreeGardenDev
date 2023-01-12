set nocompatible              " be iMproved, required
filetype off                  " required
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
filetype plugin on
filetype plugin indent on    " required
set number
set relativenumber
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'rhysd/vim-clang-format'
Plug 'cdelledonne/vim-cmake'
Plug 'embear/vim-uncrustify'
Plug 'github/copilot.vim'
Plug 'OmniSharp/omnisharp-roslyn'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
"Plug 'altercation/vim-colors-solarized'
Plug 'sheerun/vim-polyglot'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdtree'
Plug 'gruvbox-community/gruvbox'
"Plug 'davidhalter/jedi-vim'
Plug 'preservim/nerdcommenter'
"Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'itchyny/vim-cursorword'
Plug 'cpiger/NeoDebug'
Plug 'bounceme/poppy.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
autocmd BufNew,BufRead *.asm set ft=nasm
autocmd BufNew,BufRead *.inc set ft=nasm
autocmd BufNew,BufRead *.s set ft=nasm
autocmd BufEnter NERD_tree_* | execute 'normal R'
let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_colors= 'dark0'
au! cursormoved * call PoppyInit()
let NERDTreeShowHidden=1
syntax enable
filetype plugin indent on
"hi Normal guibg=NONE ctermbg=NONE
    if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
    endif

   colorscheme spaceduck
"set background=dark
"colorscheme gruvbox
"colorscheme solarized
