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
vim.cmd [[colorscheme nordfox]]

require('indent_blankline').setup {
  char = '┆',
  buftype_exclude = {"terminal"},
  show_trailing_blankline_indent = false,
  -- Disabled below because doesn't work that well without heaps of configuration
  -- show_current_context = true,
  -- context_patterns = {'class', 'function', 'method', 'for_statement'},
}
vim.cmd [[highlight IndentBlanklineChar guifg=#363535 gui=nocombine]]
vim.cmd [[nnoremap <leader>i :IndentBlanklineToggle!<CR>]]
EOF

