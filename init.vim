let &packpath=&runtimepath
runtime vimrc

lua <<EOF
require('nvim-treesitter.install').compilers = { "clang" }
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true }
}
EOF
