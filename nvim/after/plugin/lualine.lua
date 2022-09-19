require('lualine').setup{
  options = {
  component_separators = { left = '|', right = '|'},
  section_separators = { left = '', right = ''},
  theme = 'ayu_mirage'
  },

  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },
    lualine_c = {'branch', 'diff', 'diagnostics'},
    lualine_x = {'fileformat', 'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },

  extensions = {'nvim-tree'}
}
