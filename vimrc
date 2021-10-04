"VIM-PLUG
let data_dir = has('nvim') ? stdpath('config') : $HOME.'/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir.'/plugged')
  "themes
  Plug 'joshdick/onedark.vim' "colorscheme onedark

  if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "Syntax Highlighting
    Plug 'EdenEast/nightfox.nvim' "neovim theme with treesitter support (colorscheme nordfox)
  else
    Plug 'sheerun/vim-polyglot' "Syntax Highlighting
  endif
call plug#end()
filetype indent off "Side effects of plug#end()
syntax off "Side effects of plug#end()

"Key Mappings
nnoremap <leader>sv :source $MYVIMRC<CR>

"Global variables
let $RTP=split(&runtimepath, ',')[0]
let $RC = has('nvim') ? $RTP.'/vimrc' : '$HOME/.vim/vimrc'
let $INIT = $RTP.'/init.vim'

"Standard vimrc Configs
set path=.,,**

filetype plugin indent on
syntax on
set backspace=indent,eol,start
set noerrorbells
set hidden
set noswapfile
set ruler

set number
set relativenumber

set autoindent
set tabstop=8 "this is default
set softtabstop=2
set shiftwidth=2
set expandtab

set smartcase
set incsearch

set formatoptions=tcqj

"set colorcolumn=+1,+21,+31
set colorcolumn=81,111,121

"Colour Schemes
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set termguicolors

"netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl' "enable line numbers
let g:netrw_size = 20
