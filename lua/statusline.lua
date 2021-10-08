local lualine = require('lualine')

local function currentDirectory()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = {left = ' ', right = '|'},
    section_separators = {left = '  ', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {
        currentDirectory,
        icon = ' ',
        padding = {left = 0},
      },
      {
        'filename',
        path = 1,
        color = {gui = 'NONE'},
      },
    },
    lualine_c = {
      {
        'branch',
        separator = '',
        icon = '',
        padding = {left = 0, right = 1},
      },
      {
        'diff',
        padding = {left = 0, right = 1}
      }
    },
    lualine_x = {
      'encoding', 
      {
        'fileformat',
        icons_enabled = false,
      },
      {
        'filetype',
        icon = '',
        icons_enabled = false,
        padding = {left = 1, right = 2},
      },
    },
    lualine_y = {
      {
        'progress',
        icon = ' ',
      },
    },
    lualine_z = {
      {
        'location',
        padding = {left = 0},
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{'filename', path=1}},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  }
}
