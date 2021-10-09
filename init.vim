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
    bg_alt = "#212020",
    comment = "#747369",
    bg_visual = "#303030", -- colorcolumn
    bg_highlight = "#343432", -- cursorline
    fg_gutter = "#5b5b58", -- line number color
  },
  hlgroups = {
    CursorLineNr = { fg="${white_dm}" }, -- CURRENT line number color
    VertSplit = { fg="${bg_alt}", bg="${bg_alt}" },
    StatusLineNc = { bg="${bg_alt}" },
    SpecialKey = { fg="${bg}", bg="${fg}" },
  },
})
vim.cmd [[colorscheme nordfox]]

-- Indent Guide
require('indent_blankline').setup {
  char = '┆',
  buftype_exclude = {"terminal"},
  show_trailing_blankline_indent = false, -- Ident guides don't 'go through' empty lines
  -- Disabled below because doesn't work that well without heaps of configuration
  -- show_current_context = true,
  -- context_patterns = {'class', 'function', 'method', 'for_statement'},
}
vim.cmd [[highlight IndentBlanklineChar guifg=#3D3D3D gui=nocombine]]
vim.cmd [[nnoremap <leader>i :IndentBlanklineToggle!<CR>]]

package.loaded['statusline'] = nil
require('statusline')
EOF
