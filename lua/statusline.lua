local gl = require('galaxyline')

local gls = gl.section
gl.short_line_list = {'defx', 'packager', 'vista', 'NvimTree', 'nerdtree'}

local palette = {
  white   = { gui='#B2B2B2', cterm=249 },
  grey    = { gui='#949494', cterm=246 },
  dark    = { gui='#767676', cterm=243 },
  darker  = { gui='#626262', cterm=241 },
  darkest = { gui='#4E4E4E', cterm=238 },
  base    = { gui='#262626', cterm=235 },
  black   = { gui='#1C1C1C', cterm=234 },
  backgnd = { gui='#121212', cterm=233 },

  cactus  = { gui='#5F875F', cterm=065 }, -- darkgreen
  grass   = { gui='#87AF87', cterm=108 }, -- limegreen
  fruit   = { gui='#D787AF', cterm=175 }, -- coralpink
  brick   = { gui='#875F5F', cterm=095 }, -- brickpink
  purple  = { gui='#8787AF', cterm=103 },
  cyan    = { gui='#87AFD7', cterm=110 },
  red     = { gui='#D75F5F', cterm=167 },
  orange  = { gui='#D7875F', cterm=173 },
  brown   = { gui='#AF875F', cterm=137 },
  blue    = { gui='#5F87AF', cterm=067 },
}

-- initialize all colors from palette
local c = {}
for key, value in pairs(palette) do
  c[key] = value.gui
end

local s = {
  underline = 'none',
}

-- Local helper functions
local function spacing(num)
  return function() return string.rep(' ', num) end
end

local function get_current_file_name()
  local file = vim.fn.expand'%:t'
  if vim.bo.readonly and vim.bo.filetype ~= 'help' then
    file = file..' '
  end
  if not vim.bo.readonly and vim.bo.modified then
    file = file..' [+]'
  end
  return '  '..file
end

local function get_current_mode()
  local modes = {
    n      = { alias = 'NORMAL',   color = c.white  },
    i      = { alias = 'INSERT',   color = c.grass  },
    c      = { alias = 'COMMAND',  color = c.grey   },
    v      = { alias = 'VISUAL',   color = c.purple },
    V      = { alias = 'V-LINE',   color = c.purple },
    [''] = { alias = 'V-BLOCK',  color = c.purple },
    r      = { alias = 'REPLACE',  color = c.red    },
    R      = { alias = 'REPLACE',  color = c.red    },
    t      = { alias = 'TERMINAL', color = c.blue   },
    s      = { alias = 'SELECT',   color = c.brown  },
    S      = { alias = 'S-LINE',   color = c.brown  },
  }

  mode = modes[vim.fn.mode()]
  if mode == nil then
    mode = { alias = 'MISSING', color = c.fruit }
  end

  vim.cmd('hi GalaxyViMode     guifg='..mode.color)
  vim.cmd('hi GalaxyPerCent    guifg='..mode.color)
  vim.cmd('hi PerCentSeparator guifg='..mode.color)
  return '  '..mode.alias
end

local function hint_enabled_plugins()
  local enabled = {
    treesitter = pcall(vim.treesitter.get_parser, 0),
    lsp = #vim.lsp.buf_get_clients(0) ~= 0,
  }

  local flag = enabled.lsp and '+' or
    enabled.treesitter and '' or '-'
  return flag
end

local function warn_other_fileformat()
  local format = vim.bo.fileformat
  local warn = format ~= 'unix' and ' ['..format..']' or ''
  return warn
end

-- Left side
gls.left[1] = {
  ViMode = {
    provider = get_current_mode,
    highlight = {c.none, c.black, s.underline},
  }
}
gls.left[2] = {
  FileName = {
    provider = get_current_file_name,
    highlight = {c.none, c.black, s.underline},
  }
}
gls.left[3] = {
  Space = {
    provider = spacing(3),
    highlight = {c.none, c.black, s.underline},
  }
}
gls.left[4] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = ' ',
    highlight = {c.red, c.black, s.underline},
  }
}
gls.left[5] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = ' ',
    highlight = {c.orange, c.black, s.underline},
  }
}
gls.left[6] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = ' ',
    highlight = {c.none, c.black, s.underline},
  }
}

-- Right side
gls.right[1] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = function()
      local cond = require('galaxyline.condition')
      return pcall(cond.check_git_workspace)
    end,
    icon = ' ',
    highlight = {c.none, c.black, s.underline}
  }
}
gls.right[2] = {
  BufferType = {
    provider = {spacing(1), 'FileTypeName', hint_enabled_plugins, warn_other_fileformat, spacing(1)},
    condition = function()
      return vim.bo.filetype ~= ''
    end,
    highlight = {c.none, c.black, s.underline},
    separator = '',
    separator_highlight = {c.none, c.black, s.underline}
  }
}
gls.right[3] = {
  PerCent = {
    provider = 'LinePercent',
    highlight = {c.none, c.black, s.underline},
    separator = '',
    separator_highlight = {c.none, c.black, s.underline}
  }
}

-- Short status line
gls.short_line_left[1] = {
  FileName = {
    provider = get_current_file_name,
    highlight = {c.none, c.black, s.underline}
  }
}

-- Force manual load so that nvim boots with a status line
gl.load_galaxyline()
