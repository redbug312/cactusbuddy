local Color, c, Group, g, s = require('colorbuddy').setup()
local v = vim

v.g.colors_name = 'cactusbuddy'

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

-- assume this function exists
Group.link = function(name, group)
  Group.new(name, group, group, group)
end

-- initialize all colors from palette
for key, value in pairs(palette) do
  Color.new(key, value.gui)
end

-- EDITOR BASICS

Group.new('Header',       c.white,  c.none,  s.none)
Group.new('Normal',       c.grey,   c.none,  s.none)
Group.new('Noise',        c.dark,   c.none,  s.none)
Group.new('Comment',      c.darker, c.none,  s.none)
Group.new('NonText',      c.darkest, c.none, s.none)

Group.new('String',       c.cactus, c.none,  s.none)
Group.new('Constant',     c.grass,  c.none,  s.none)
Group.new('Todo',         c.fruit,  c.none,  s.none)
Group.new('Special',      c.purple, c.none,  s.none)
Group.new('Title',        c.cyan,   c.none,  s.none)
Group.new('Error',        c.red,    c.none,  s.none)
Group.new('Warning',      c.orange, c.none,  s.none)
Group.new('User1',        c.brown,  c.none,  s.none)
Group.new('User2',        c.blue,   c.none,  s.none)
Group.new('User3',        c.brick,  c.none,  s.none)

Group.new('DiffAdd',      c.cactus, c.none,  s.none)
Group.new('DiffChange',   c.none,   c.none,  s.none)
Group.new('DiffDelete',   c.brick,  c.none,  s.none)
Group.new('DiffText',     c.brown,  c.none,  s.none)
Group.new('DiffAdded',    c.cactus, c.none,  s.none)
Group.new('DiffRemoved',  c.brick,  c.none,  s.none)
Group.new('DiffLine',     c.darker, c.none,  s.underline)

Group.new('SpellBad',     c.red,    c.none,  s.undercurl)
Group.new('SpellCap',     c.orange, c.none,  s.undercurl)
Group.new('SpellRare',    c.brown,  c.none,  s.undercurl)
Group.new('SpellLocal',   c.blue,   c.none,  s.undercurl)

Group.new('IncSearch',    c.none,   c.none,  s.reverse)
Group.new('Search',       c.fruit,  c.none,  s.underline)
Group.new('WildMenu',     c.fruit,  c.base,  s.none)

Group.new('Visual',       c.none,   c.base,  s.none)
Group.new('VisualNOS',    c.none,   c.base,  s.none)
Group.new('StatusLine',   c.none,   c.black, s.none)
Group.new('StatusLineNC', c.grey,   c.black, s.none)
Group.new('CursorLine',   c.none,   c.black, s.none)
Group.new('CursorLineNr', c.grey,   c.none,  s.none)
Group.new('MatchParen',   c.cyan,   c.none,  s.none)

-- LINKS

Group.link('Identifier',     g.Normal)
Group.link('Function',       g.Normal)
Group.link('Delimiter',      g.Normal)
Group.link('Statement',      g.Normal)

Group.link('Operator',       g.Noise)
Group.link('Macro',          g.Noise)
Group.link('PreCondit',      g.Noise)
Group.link('Type',           g.Noise)
Group.link('StorageClass',   g.Type)
Group.link('Structure',      g.Type)
Group.link('Typedef',        g.Type)
Group.link('Include',        g.Statement)
Group.link('Conditional',    g.Statement)
Group.link('Repeat',         g.Statement)
Group.link('Label',          g.Statement)
Group.link('Keyword',        g.Statement)
Group.link('Exception',      g.Statement)

Group.link('PreProc',        g.Special)
Group.link('SpecialChar',    g.Special)
Group.link('Tag',            g.Special)
Group.link('SpecialKey',     g.Special)
Group.link('SpecialComment', g.Special)
Group.link('Debug',          g.Special)
Group.link('Define',         g.PreProc)

Group.link('Character',      g.Constant)
Group.link('Number',         g.Constant)
Group.link('Boolean',        g.Constant)
Group.link('Float',          g.Constant)
Group.link('Directory',      g.String)

-- USER INTERFACE

Group.link('ModeMsg',     g.Normal)
Group.link('MoreMsg',     g.Normal)
Group.link('ErrorMsg',    g.Error)
Group.link('WarningMsg',  g.Warning)
Group.link('Question',    g.Warning)

Group.link('LineNr',      g.NonText)
Group.link('Folded',      g.NonText)
Group.link('VertSplit',   g.NonText)
Group.link('EndOfBuffer', g.NonText)
Group.link('Whitespace',  g.NonText)
Group.link('qfLineNr',    g.LineNr)
Group.link('FoldColumn',  g.LineNr)
Group.link('SignColumn',  g.LineNr)
Group.link('ColorColumn', g.CursorLine)

Group.link('Pmenu',       g.StatusLine)
Group.link('PmenuSel',    g.WildMenu)
Group.link('PmenuSbar',   g.Pmenu)
Group.link('PmenuThumb',  g.Pmenu)
Group.link('NormalFloat', g.Pmenu)

Group.link('TabLine',     g.Normal)
Group.link('TabLineSel',  g.Special)
Group.link('TabLineFill', g.Normal)

Group.link('NvimInternalError', g.Error)

-- PLUGIN SPECIFIC

local statusline = vim.g.cactusbuddy_galaxyline_enabled
if statusline then require 'statusline' end

Group.link('TSNamespace',       g.Noise)
Group.link('TSPunctDelimiter',  g.Noise)
Group.link('TSConstructor',     g.Noise)
Group.link('TSVariableBuiltin', g.String)  -- for `self`
Group.link('TSConstant',        g.User1)
Group.link('TSLabel',           g.User2)
-- Group.link('TSConditional',     g.Statement)
-- Group.link('TSFuncBuiltin',     g.User1)
-- Group.link('TSKeywordSpecial',  g.Special)
-- Group.link('TSKeywordOperator', g.Statement)
-- Group.link('TSDefinition',      g.IncSearch)

Group.link('LspDiagnosticsDefaultError',       g.Error)
Group.link('LspDiagnosticsDefaultWarning',     g.Warning)
Group.link('LspDiagnosticsDefaultInformation', g.NonText)
Group.link('LspDiagnosticsDefaultHint',        g.NonText)

Group.link('PackerStatusCommit',  g.Statement)
Group.link('PackerStatusSuccess', g.Statement)
Group.link('PackerHash',          g.Constant)

Group.link('ALEErrorSign',   g.Error)
Group.link('ALEWarningSign', g.Warning)

Group.link('GitGutterAdd',          g.Normal)
Group.link('GitGutterChange',       g.Normal)
Group.link('GitGutterChangeDelete', g.Normal)
Group.link('GitGutterDelete',       g.Normal)

Group.link('SignatureMarkText',   g.Noise)
Group.link('SignatureMarkerText', g.Noise)

Group.link('NvimTreeFolderIcon', g.Directory)
Group.link('NvimTreeRootFolder', g.Statement)
Group.link('NvimTreeSymlink',    g.Special)

Group.link('TagbarScope',           g.String)
Group.link('TagbarSignature',       g.Noise)
Group.link('TagbarHighlight',       g.Todo)
Group.link('TagbarAccessPrivate',   g.DiffDelete)
Group.link('TagbarAccessProtected', g.DiffText)
Group.link('TagbarAccessPublic',    g.DiffAdd)

-- LANGUAGE SPECIFIC

Group.link('vimCommand',   g.Statement)
Group.link('vimnotfunc',   g.Statement)
Group.link('vimlet',       g.Statement)
Group.link('vimAutoCmd',   g.Statement)
Group.link('vimAutoEvent', g.User2)
Group.link('vimHighlight', g.Statement)
Group.link('vimHiBang',    g.Statement)
Group.link('vimMap',       g.Statement)
Group.link('vimMapMod',    g.Special)
Group.link('vimmapmodkey', g.Special)
Group.link('vimmaplhs',    g.Normal)
Group.link('vimbracket',   g.Special)
Group.link('vimnotation',  g.Special)
Group.link('vimiscommand', g.Normal)

Group.link('helpSectionDelim',   g.Noise)
Group.link('helpHeadline',       g.Title)
Group.link('helpHeader',         g.Header)
Group.link('helpHyperTextEntry', g.Constant)
Group.link('helpOption',         g.String)
Group.link('helpIgnore',         g.NonText)

Group.link('diffFile',      g.Noise)
Group.link('diffIndexLine', g.Noise)
Group.link('diffOldFile',   g.Special)
Group.link('diffNewFile',   g.Special)
Group.link('diffSubname',   g.Statement)

Group.link('makeTarget',     g.Header)
Group.link('makeSpecTarget', g.Statement)
Group.link('makeCommands',   g.String)

Group.link('texMath',         g.User1)
Group.link('texGreek',        g.User2)
Group.link('texMathSymbol',   g.User2)
Group.link('texStatement',    g.Normal)
Group.link('texDelimiter',    g.Noise)
Group.link('texTitle',        g.Title)
Group.link('texInputFile',    g.String)
Group.link('texBeginEndName', g.Normal)

Group.link('htmlH1',     g.Title)
Group.link('htmlH2',     g.Title)
Group.link('htmlH3',     g.Header)
Group.link('htmlH4',     g.Header)
Group.link('htmlBold',   g.Constant)
Group.link('htmlItalic', g.Constant)
Group.link('htmlLink',   g.Normal)

Group.link('rustModPath',        g.Noise)
Group.link('rustModPathSep',     g.Noise)
Group.link('rustCommentLineDoc', g.Noise)
Group.link('rustDerive',         g.Noise)
Group.link('rustAttribute',      g.Noise)
Group.link('rustTrait',          g.Noise)
Group.link('rustSelf',           g.String)
Group.link('rustEnumVariant',    g.User1)
Group.link('rustLifetime',       g.User2)
Group.link('rustQuestionMark',   g.Title)
