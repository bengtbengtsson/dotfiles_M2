" Need the following installed to get plugins to work
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Once installed run `:PlugInstall`

" Basic settings
set nocompatible          " Disable compatibility with old Vi
filetype plugin indent on " Enable filetype detection, plugins, and indentation
syntax on                 " Enable syntax highlighting
set encoding=utf-8        " Use UTF-8 encoding
set number                " Show line numbers
set relativenumber        " Show relative line numbers
set showcmd               " Show incomplete commands
set cursorline            " Highlight the current line
set wrap                  " Enable line wrapping
set linebreak             " Break lines at word boundaries
set clipboard=unnamedplus " Use the system clipboard

" Tabs and Indentation
set tabstop=4             " Number of spaces a tab counts for
set shiftwidth=4          " Number of spaces for each level of indentation
set expandtab             " Use spaces instead of tabs
set autoindent            " Copy indent from the current line when starting a new line
set smartindent           " Smart auto-indentation

" Search settings
set ignorecase            " Ignore case when searching
set smartcase             " Override 'ignorecase' if search contains uppercase letters
set hlsearch              " Highlight search results
set incsearch             " Show matches as you type

" Performance tweaks
set lazyredraw            " Redraw screen only when necessary
set updatetime=300        " Faster completion (default is 4000ms)
set timeoutlen=500        " Shorter timeout for mapped sequences

" Key mappings
nnoremap <Space> :noh<CR> " Clear search highlights with Space
nnoremap Y y$             " Make 'Y' behave like 'D' and 'C'
vnoremap < <gv            " Indent visually selected block left and reselect
vnoremap > >gv            " Indent visually selected block right and reselect

" Disable arrow keys in normal mode
nnoremap <Up>    <nop>
nnoremap <Down>  <nop>
nnoremap <Left>  <nop>
nnoremap <Right> <nop>

" Disable arrow keys in insert mode
inoremap <Up>    <nop>
inoremap <Down>  <nop>
inoremap <Left>  <nop>
inoremap <Right> <nop>

" Disable arrow keys in visual mode
vnoremap <Up>    <nop>
vnoremap <Down>  <nop>
vnoremap <Left>  <nop>
vnoremap <Right> <nop>

" File and buffer management
set hidden                " Allow switching buffers without saving
set backup                " Enable backups
set backupdir=~/.vim/backups " Directory for backup files
set undofile              " Enable persistent undo
set undodir=~/.vim/undo   " Directory for undo files

" Plugins (e.g., with vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'             " File explorer
Plug 'junegunn/fzf.vim'               " Fuzzy finder
Plug 'tpope/vim-commentary'           " Commenting utility
Plug 'vim-airline/vim-airline'        " Status bar
Plug 'sheerun/vim-polyglot'           " Syntax and language packs
Plug 'LnL7/vim-nix'  " Nix syntax highlighting
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'sainnhe/gruvbox-material'       " Gruvbox theme
Plug 'github/copilot.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" Plugin-specific configurations
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab  " Python-specific indentation

" Appearance
" These lines must be after the Plugins
set background=dark                " Set background to dark
colorscheme gruvbox-material       " Use Gruvbox colorscheme
