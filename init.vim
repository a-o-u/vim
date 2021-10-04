let &packpath=&runtimepath
runtime vimrc

lua <<EOF
-- Tree Sitter
require('nvim-treesitter.install').compilers = { "clang" }
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true }
}

-- Neovim Colour Scheme
-- Nordfox
require('nightfox').setup({
  fox = "nordfox",
  inverse = {
    visual = true,
  },
  colors = {
    bg = "#282828",
    comment = "#747369",
    bg_visual = "#303030",
  }
})
EOF

colorscheme nordfox
