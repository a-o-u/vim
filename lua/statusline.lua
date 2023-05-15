local lualine = require('lualine')
local colors = require('nightfox.palette').load('nordfox')
local spec = require('nightfox.spec').load('nordfox')

-- Component for that gets current window directory
local function currentDirectory()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
end

-- Theme
colors.violet = '#7c7cff';
colors.purple = '#5d4d7a';
colors.gray = '#333842';
colors.light_gray = '#444b59';

local theme = {
  normal = {
    a = {bg = colors.green.base, fg = colors.black.base},
    b = {fg = colors.white.dim, bg = colors.gray},
    c = {fg = colors.violet, bg = colors.bg2},
    x = {fg = colors.white.dim, bg = colors.bg2},
    z = {bg = colors.purple},
  },
  insert = {
    a = {bg = colors.cyan.dim, fg = colors.black.base},
  },
  visual = {
    a = {bg = colors.orange.dim, fg = colors.black.base},
  },
  replace = {
    a = {bg = colors.magenta.base, fg = colors.black.base},
  },
  command = {
    a = {bg = colors.yellow.bright, fg = colors.black.base},
  },
  terminal = {
    a = {bg = colors.black.bright, fg = colors.white.base},
  },
  inactive = {
    c = {bg = colors.bg2, fg = colors.white.dim},
    x = {bg = colors.bg2, fg = colors.white.dim},
  }
}
-- Theme End

lualine.setup {
  options = {
    icons_enabled = true,
    -- theme = 'gruvbox',
    -- theme = colors,
    theme = require("nightfox.util.lualine")("nordfox"),
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
        padding = {left = 0, right = 1},
        colored = true,
        diff_color = {
          added = {fg = spec.git.add},
          modified = {fg = spec.git.change},
          removed = {fg = spec.git.delete},
        },
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
        padding = {left = 0, right = 1},
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
