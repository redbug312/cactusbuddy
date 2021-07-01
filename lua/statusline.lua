local builtin = require('el.builtin')
local extensions = require('el.extensions')
local sections = require('el.sections')
local subscribe = require('el.subscribe')

local function show_current_mode(window, buffer)
  local mode = extensions.mode(window, buffer)
  local text = window.is_active and mode:upper() or ''
  return text
end

local function show_diagnostics(_, buffer)
  local enabled = #vim.lsp.buf_get_clients(0) ~= 0
  if not enabled then
    return ''
  end

  local _, client = next(vim.lsp.get_active_clients())
  local counts = {
    error = vim.lsp.diagnostic.get_count(buffer.bufnr, 'Error', client.id),
    warn  = vim.lsp.diagnostic.get_count(buffer.bufnr, 'Warning', client.id),
    info  = vim.lsp.diagnostic.get_count(buffer.bufnr, 'Information', client.id),
  }

  local texts = {
    counts.error ~= 0 and string.format('%%#%s# %s%%*', 'ElError', counts.error) or '',
    counts.warn  ~= 0 and string.format('%%#%s# %s%%*', 'ElWarning', counts.warn) or '',
    counts.info  ~= 0 and string.format('%%#%s# %s%%*', 'ElInformation', counts.info) or '',
  }
  local text = table.concat(texts, ' ')
  return text
end

local function show_git_branch(window, buffer)
  local branch = extensions.git_branch(window, buffer)
  local text = branch and ' '..branch..'  '
  return text
end

local function show_enabled_plugins()
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

local function warn_paste_mode(window, _)
  local enabled = vim.o.paste
  local warn = (window.is_active and enabled) and ' PASTE' or ''
  return warn
end

local generator = function()
  local segments = {}
  table.insert(segments, show_current_mode)
  table.insert(segments, warn_paste_mode)
  table.insert(segments, ' ')
  table.insert(segments, sections.highlight('StatusLine', builtin.tail_file))
  table.insert(segments, ' ')
  table.insert(segments, builtin.modified_flag)
  table.insert(segments, ' ')
  table.insert(segments, show_diagnostics)
  table.insert(segments, sections.split)
  table.insert(segments,
    subscribe.buf_autocmd('el_git_branch', 'BufEnter', show_git_branch)
  )
  table.insert(segments, builtin.filetype_list)
  table.insert(segments, show_enabled_plugins)
  table.insert(segments, warn_other_fileformat)
  table.insert(segments, '  ')
  table.insert(segments, builtin.percentage_through_file)
  table.insert(segments, '%%')
  return segments
end

require('el').setup { generator = generator }

-- MODE COLORS

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

local highlights = {
  ElCommand               = palette.grey,
  ElCommandCV             = palette.grey,
  ElCommandEx             = palette.grey,
  ElConfirm               = palette.grey,
  ElInsertCompletion      = palette.grass,
  ElInsert                = palette.grass,
  ElMore                  = palette.grey,
  ElNormal                = palette.white,
  ElNormalOperatorPending = palette.white,
  ElPrompt                = palette.grey,
  ElReplace               = palette.red,
  ElSBlock                = palette.brown,
  ElSelect                = palette.brown,
  ElShell                 = palette.blue,
  ElSLine                 = palette.brown,
  ElTerm                  = palette.blue,
  ElVirtualReplace        = palette.purple,
  ElVisualBlock           = palette.purple,
  ElVisualLine            = palette.purple,
  ElVisual                = palette.purple,

  ElError                 = palette.red,
  ElWarning               = palette.orange,
  ElInformation           = palette.grey,
}

for group, color in pairs(highlights) do
  vim.cmd('hi '..group..' guifg='..color.gui..' guibg='..palette.black.gui)
end
