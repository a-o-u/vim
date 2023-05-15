let &packpath=&runtimepath
runtime vimrc

lua <<EOF
-- Tree Sitter
require('nvim-treesitter.install').compilers = { "clang" }
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true }
}

-- LSP/IDE and Autocomplete

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require('luasnip')

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
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
