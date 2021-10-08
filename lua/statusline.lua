local lualine = require('lualine')
local colors = require('nightfox.colors').load('nordfox')

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
    a = {bg = colors.green, fg = colors.black},
    b = {fg = colors.white_dm, bg = colors.gray},
    c = {fg = colors.violet, bg = colors.bg_alt},
    x = {fg = colors.white_dm, bg = colors.bg_alt},
    z = {bg = colors.purple},
  },
  insert = {
    a = {bg = colors.cyan_dm, fg = colors.black},
  },
  visual = {
    a = {bg = colors.orange_dm, fg = colors.black},
  },
  replace = {
    a = {bg = colors.magenta, fg = colors.black},
  },
  command = {
    a = {bg = colors.yellow_br, fg = colors.black},
  },
  inactive = {
    c = {bg = colors.bg_alt, fg = colors.white_dm},
    x = {bg = colors.bg_alt, fg = colors.white_dm},
  }
}
-- Theme End

lualine.setup {
  options = {
    icons_enabled = true,
    -- theme = 'gruvbox',
    theme = theme,
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
          added = {fg = colors.git.add},
          modified = {fg = colors.git.change},
          removed = {fg = colors.git.delete},
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
