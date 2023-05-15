"VIM-PLUG
let data_dir = has('nvim') ? stdpath('config') : $HOME.'/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

echo v:version

call plug#begin(data_dir.'/plugged')
  "Plug 'tmsvg/pear-tree' "Bracket matching (vim) plugin that works for vim and neovim (works nicer with .)
  Plug 'jiangmiao/auto-pairs' "Bracket matching (vim) plugin that works for vim and neovim
  if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "Syntax Highlighting
    Plug 'EdenEast/nightfox.nvim' "Neovim theme with treesitter support (colorscheme nordfox)
    Plug 'lukas-reineke/indent-blankline.nvim' "Indent guides
    Plug 'nvim-lualine/lualine.nvim' "Status line
    Plug 'neovim/nvim-lspconfig' "Language server/IDE
    Plug 'hrsh7th/nvim-cmp' "Autocomplete
    Plug 'hrsh7th/cmp-nvim-lsp' "Support for more autocomplete candidates
    Plug 'saadparwaiz1/cmp_luasnip' "Snippet source for nvim-cmp
    Plug 'L3MON4D3/LuaSnip' "Snippets plugin
  else
    Plug 'sheerun/vim-polyglot' "Syntax Highlighting
    Plug 'joshdick/onedark.vim' "colorscheme onedark
  endif
call plug#end()
filetype indent off "Side effects of plug#end()
syntax off "Side effects of plug#end()

"Global variables
let $RTP=split(&runtimepath, ',')[0]
let $RC = has('nvim') ? $RTP.'/vimrc' : '$HOME/.vim/vimrc'

"Key Mappings
let mapleader=" "
nnoremap <SPACE> <Nop>
"Quick source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
"Esc works in terminal mode
tnoremap <Esc> <C-\><C-n>
"Fast buffer switch
nnoremap <leader>b :ls<CR>:b<Space>
"Fast find
nnoremap <leader>f :find *
"Clear search highlighting
nnoremap <leader>h :noh<CR>
"Toggle cursorline
nnoremap <leader>cl :set cursorline!<CR>
"Edit alternate file
nnoremap <leader><Tab> <C-^>
"J and K works on wrapped lines
nnoremap j gj
nnoremap k gk

"Git Key Mappings
nnoremap <leader>gC :!git commit -am "
nnoremap <leader>gA :!git commit --amend -am "
nnoremap <leader>gs :!git status<CR>
nnoremap <leader>gb :!git branch<CR>:!git checkout 
nnoremap <leader>gB :!git branch<CR>:!git checkout -b 
nnoremap <leader>gdb :!git branch<CR>:!git branch -d 
nnoremap <leader>gP :!git status<CR>:!git push 
nnoremap <leader>gl :!git log<CR>

"Set global file marks on leave
"Could be moved to filetype specific command?
augroup GlobalFileMarksOnLeave
  autocmd!

  autocmd BufLeave *.css,*.less,*.sass normal! mC
  autocmd Bufleave *.html,*.htm normal! mH
  autocmd Bufleave *.ts,*.js normal! mJ
augroup END

augroup CursorLine
  autocmd!

  autocmd VimEnter * setlocal cursorline
  autocmd WinEnter * setlocal cursorline
  autocmd BufWinEnter * setlocal cursorline
  autocmd WinLeave * set nocursorline
augroup END

"Standard vimrc Configs
set path=.,,**
set noerrorbells
set hidden
set noswapfile

set fileformat=unix
filetype plugin indent on
syntax on
set autoread
set backspace=indent,eol,start

set autoindent
set tabstop=8 "this is default
set softtabstop=2
set shiftwidth=2
set expandtab

set completeopt=menu,menuone,longest
set matchpairs+=<:>

set startofline

set splitbelow
set splitright

set wildmenu
set wildmode=longest:full

"Visual

"Current cursor position in the status bar
set ruler
set laststatus=2
"
"Highlight current line
set cursorline

"Rulers
"set colorcolumn=+1,+21,+31
set colorcolumn=81,111,121

set number
set relativenumber

set smartcase
set incsearch
set hlsearch

set formatoptions=tcqjn

"Colour Schemes
if !empty(glob(data_dir.'/plugged/onedark.vim'))
  if has('termguicolors')
    set termguicolors
  endif
  colorscheme onedark
end

"netrw
let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_sort_options='i'
let g:netrw_browse_split=0
let g:netrw_bufsettings='noma nomod nu nowrap ro nobl' "enable line numbers
let g:netrw_sizestyle='h' "setting doesn't work in Windows?
