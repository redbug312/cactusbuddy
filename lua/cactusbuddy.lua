local Color, c, Group, g, s = require('colorbuddy').setup()
local v = vim

v.g.colors_name = 'cactusbuddy'

local palette = {
  white   = { gui='#bcbcbc', cterm=250 },
  grey    = { gui='#949494', cterm=246 },
  dark    = { gui='#767676', cterm=243 },
  darker  = { gui='#585858', cterm=240 },
  darkest = { gui='#3a3a3a', cterm=237 },
  base    = { gui='#262626', cterm=235 },
  black   = { gui='#1c1c1c', cterm=234 },
  backgnd = { gui='#121212', cterm=233 },

  cactus  = { gui='#5f875f', cterm=065 }, -- darkgreen
  grass   = { gui='#87af87', cterm=108 }, -- limegreen
  fruit   = { gui='#d787af', cterm=175 }, -- coralpink
  brick   = { gui='#875f5f', cterm=095 }, -- brickpink
  purple  = { gui='#8787af', cterm=103 },
  cyan    = { gui='#87afd7', cterm=110 },
  red     = { gui='#d75f5f', cterm=167 },
  orange  = { gui='#d7875f', cterm=173 },
  brown   = { gui='#af875f', cterm=137 },
  blue    = { gui='#5f87af', cterm=067 },
}

-- initialize all colors from palette
for key, value in pairs(palette) do
  Color.new(key, value.gui)
end

-- EDITOR BASICS

Group.new('Header',       c.white,   c.none,  s.none)
Group.new('Normal',       c.grey,    c.none,  s.none)
Group.new('Noise',        c.dark,    c.none,  s.none)
Group.new('Comment',      c.darker,  c.none,  s.none)
Group.new('NonText',      c.darkest, c.none,  s.none)

Group.new('Error',        c.red,     c.none,  s.none)
Group.new('Number',       c.grass,   c.none,  s.none)
Group.new('Special',      c.purple,  c.none,  s.none)
Group.new('String',       c.cactus,  c.none,  s.none)
Group.new('Title',        c.cyan,    c.none,  s.none)
Group.new('Todo',         c.fruit,   c.none,  s.none)
Group.new('User1',        c.brown,   c.none,  s.none)
Group.new('User2',        c.blue,    c.none,  s.none)
Group.new('User3',        c.brick,   c.none,  s.none)
Group.new('Warning',      c.orange,  c.none,  s.none)

Group.new('DiffAdd',      c.cactus,  c.none,  s.none)
Group.new('DiffAdded',    c.cactus,  c.none,  s.none)
Group.new('DiffChange',   c.none,    c.none,  s.none)
Group.new('DiffDelete',   c.brick,   c.none,  s.none)
Group.new('DiffLine',     c.darker,  c.none,  s.underline)
Group.new('DiffRemoved',  c.brick,   c.none,  s.none)
Group.new('DiffText',     c.brown,   c.none,  s.none)

Group.new('SpellBad',     c.red,     c.none,  s.undercurl)
Group.new('SpellCap',     c.orange,  c.none,  s.undercurl)
Group.new('SpellLocal',   c.brown,   c.none,  s.undercurl)
Group.new('SpellRare',    c.blue,    c.none,  s.undercurl)

Group.new('IncSearch',    c.none,    c.none,  s.reverse)
Group.new('MatchParen',   c.cyan,    c.none,  s.none)
Group.new('Search',       c.fruit,   c.none,  s.underline)
Group.new('StatusLine',   c.none,    c.black, s.none)
Group.new('StatusLineNC', c.black,   c.black, s.none)
Group.new('URI',          c.cactus,  c.none,  s.underline)
Group.new('Visual',       c.none,    c.base,  s.none)
Group.new('VisualNOS',    c.none,    c.base,  s.none)
Group.new('WildMenu',     c.fruit,   c.base,  s.none)

-- LINKS

Group.link('Function',       g.Normal)
Group.link('Identifier',     g.Normal)
Group.link('Statement',      g.Normal)

Group.link('Conditional',    g.Statement)
Group.link('Delimiter',      g.Noise)
Group.link('Exception',      g.Statement)
Group.link('Include',        g.Statement)
Group.link('Keyword',        g.Statement)
Group.link('Macro',          g.Noise)
Group.link('Operator',       g.Noise)
Group.link('PreCondit',      g.Noise)
Group.link('Repeat',         g.Statement)
Group.link('StorageClass',   g.Type)
Group.link('Structure',      g.Type)
Group.link('Type',           g.Noise)
Group.link('Typedef',        g.Type)

Group.link('Debug',          g.Special)
Group.link('Define',         g.Special)
Group.link('PreProc',        g.Special)
Group.link('SpecialChar',    g.Special)
Group.link('SpecialComment', g.Special)
Group.link('SpecialKey',     g.Special)
Group.link('Tag',            g.Special)

Group.link('Boolean',        g.Number)
Group.link('Character',      g.Number)
Group.link('Float',          g.Number)

Group.link('Directory',      g.String)
Group.link('Constant',       g.User1)
Group.link('Label',          g.User2)

-- USER INTERFACE

Group.link('ErrorMsg',      g.Error)
Group.link('ModeMsg',       g.Normal)
Group.link('MoreMsg',       g.Normal)
Group.link('Question',      g.Warning)
Group.link('WarningMsg',    g.Warning)
Group.link('HealthSuccess', g.String)

Group.link('ColorColumn',  g.CursorLine)
Group.link('CursorLine',   g.StatusLine)
Group.link('CursorLineNr', g.Normal)
Group.link('EndOfBuffer',  g.NonText)
Group.link('FoldColumn',   g.LineNr)
Group.link('Folded',       g.NonText)
Group.link('LineNr',       g.NonText)
Group.link('QFLineNr',     g.LineNr)
Group.link('SignColumn',   g.LineNr)
Group.link('VertSplit',    g.NonText)
Group.link('Whitespace',   g.NonText)

Group.link('NormalFloat',  g.StatusLine)
Group.link('Pmenu',        g.StatusLine)
Group.link('PmenuSbar',    g.Pmenu)
Group.link('PmenuSel',     g.WildMenu)
Group.link('PmenuThumb',   g.Pmenu)
Group.link('TabLine',      g.Normal)
Group.link('TabLineFill',  g.Normal)
Group.link('TabLineSel',   g.Special)

Group.link('NvimInternalError', g.Error)
Group.link('FloatBorder',  g.NonText)

-- PLUGIN SPECIFIC

if vim.g.cactusbuddy_express_line_enabled then
  require 'statusline'
end

Group.new('DiagnosticUnderlineError', c.none, c.none, s.underline, c.red)
Group.new('DiagnosticUnderlineWarn',  c.none, c.none, s.underline, c.orange)
Group.new('DiagnosticUnderlineHint',  c.none, c.none, s.underline)
Group.new('DiagnosticUnderlineInfo',  c.none, c.none, s.underline)

Group.link('DiagnosticError',       g.Error)
Group.link('DiagnosticWarn',        g.Warning)
Group.link('DiagnosticHint',        g.Comment)
Group.link('DiagnosticInfo',        g.Comment)

-- for telescope highlights
Group.link('LspDiagnosticsDefaultError',       g.Error)
Group.link('LspDiagnosticsDefaultWarning',     g.Warning)
Group.link('LspDiagnosticsDefaultHint',        g.Noise)
Group.link('LspDiagnosticsDefaultInformation', g.Noise)

Group.link('TSConstant',            g.Constant)
Group.link('TSConstructor',         g.Noise)
Group.link('TSFuncBuiltin',         g.Noise)
Group.link('TSKeywordFunction',     g.Noise)
Group.link('TSNamespace',           g.Noise)
Group.link('TSPunctDelimiter',      g.Noise)
Group.link('TSTextReference',       g.Noise)
Group.link('TSURI',                 g.URI)
Group.link('TSVariableBuiltin',     g.String)  -- for `self`

Group.link('PackerHash',            g.Number)
Group.link('PackerStatusCommit',    g.Statement)
Group.link('PackerStatusSuccess',   g.Statement)

Group.link('ALEErrorSign',          g.Error)
Group.link('ALEWarningSign',        g.Warning)

Group.link('GitGutterAdd',          g.Normal)
Group.link('GitGutterChange',       g.Normal)
Group.link('GitGutterChangeDelete', g.Normal)
Group.link('GitGutterDelete',       g.Normal)

Group.link('NvimTreeExecFile',      g.User1)
Group.link('NvimTreeFolderIcon',    g.String)
Group.link('NvimTreeGitDeleted',    g.Noise)
Group.link('NvimTreeGitDirty',      g.Noise)
Group.link('NvimTreeGitMerge',      g.Warning)
Group.link('NvimTreeGitNew',        g.Noise)
Group.link('NvimTreeGitRenamed',    g.Noise)
Group.link('NvimTreeGitStaged',     g.Noise)
Group.link('NvimTreeImageFile',     g.Noise)
Group.link('NvimTreeIndentMarker',  g.Noise)
Group.link('NvimTreeRootFolder',    g.Statement)
Group.link('NvimTreeSpecialFile',   g.Noise)
Group.link('NvimTreeSymlink',       g.User2)

Group.new('NvimTreeWindowPicker',   c.orange, c.black)  -- g.StatusLineHint?

Group.link('TelescopeBorder',       g.Noise)
Group.link('TelescopeMatching',     g.Warning)

Group.link('AerialEnumIcon',        g.Normal)
Group.link('AerialFieldIcon',       g.Noise)
Group.link('AerialFunctionIcon',    g.Noise)
Group.link('AerialInterfaceIcon',   g.User1)
Group.link('AerialLine',            g.Special)
Group.link('AerialModuleIcon',      g.Comment)
Group.link('AerialStructIcon',      g.String)

-- LANGUAGE SPECIFIC

Group.link('vimAutoCmd',         g.Statement)
Group.link('vimAutoEvent',       g.User2)
Group.link('vimCommand',         g.Statement)
Group.link('vimHiBang',          g.Statement)
Group.link('vimHighlight',       g.Statement)
Group.link('vimMap',             g.Statement)
Group.link('vimMapMod',          g.Special)
Group.link('vimBracket',         g.Special)
Group.link('vimIsCommand',       g.Normal)
Group.link('vimLet',             g.Statement)
Group.link('vimMaplhs',          g.Normal)
Group.link('vimMapmodkey',       g.Special)
Group.link('vimNotation',        g.Special)
Group.link('vimNotFunc',         g.Statement)

Group.link('helpHeader',         g.Header)
Group.link('helpHeadline',       g.Title)
Group.link('helpHyperTextEntry', g.Number)
Group.link('helpIgnore',         g.NonText)
Group.link('helpOption',         g.String)
Group.link('helpSectionDelim',   g.Noise)

Group.link('diffFile',           g.Noise)
Group.link('diffIndexLine',      g.Noise)
Group.link('diffNewFile',        g.Special)
Group.link('diffOldFile',        g.Special)
Group.link('diffSubname',        g.Statement)

Group.link('makeCommands',       g.Noise)
Group.link('makeDefine',         g.Noise)
Group.link('makeSpecTarget',     g.User2)
Group.link('makeStatement',      g.Noise)
Group.link('makeSpecial',        g.Title)
Group.link('makeCmdNextLine',    g.Special)

Group.link('texBeginEnd',        g.Noise)
Group.link('texBeginEndName',    g.Noise)
Group.link('texCite',            g.String)
Group.link('texDelimiter',       g.Noise)
Group.link('texGreek',           g.User2)
Group.link('texInputFile',       g.String)
Group.link('texMath',            g.Noise)
Group.link('texMathSymbol',      g.User2)
Group.link('texSection',         g.Header)
Group.link('texStatement',       g.User1)
Group.link('texSubscript',       g.Noise)
Group.link('texTitle',           g.Title)
Group.link('texType',            g.Noise)
Group.link('texEmphStyle',       g.Special)
Group.link('texRefZone',         g.Noise)

Group.link('htmlBold',           g.Number)
Group.link('htmlH1',             g.Title)
Group.link('htmlH2',             g.Title)
Group.link('htmlH3',             g.Header)
Group.link('htmlH4',             g.Header)
Group.link('htmlItalic',         g.Number)
Group.link('htmlLink',           g.Normal)

Group.link('cssAttr',              g.Normal)
Group.link('cssFunctionName',      g.Normal)
Group.link('cssAttrComma',         g.Noise)
Group.link('cssCustomProp',        g.Noise)
Group.link('cssProp',              g.Noise)
Group.link('cssSelectorOp',        g.Noise)
Group.link('cssSelectorOp2',       g.Noise)
Group.link('cssStringQQ',          g.Noise)
Group.link('cssColor',             g.String)
Group.link('cssUnitDecorators',    g.String)
Group.link('cssValueLength',       g.String)
Group.link('cssPseudoClassId',     g.User1)
Group.link('cssAtRule',            g.User2)
Group.link('cssAttributeSelector', g.User2)
Group.link('cssFunction',          g.User2)
Group.link('cssMediaType',         g.User2)

Group.link('rustAttribute',      g.Noise)
Group.link('rustCommentLineDoc', g.NonText)
Group.link('rustDerive',         g.Noise)
Group.link('rustEnumVariant',    g.User1)
Group.link('rustLifetime',       g.User2)
Group.link('rustModPath',        g.Noise)
Group.link('rustModPathSep',     g.Noise)
Group.link('rustPubScope',       g.Noise)
Group.link('rustPubScopeCrate',  g.Noise)
Group.link('rustPubScopeDelim',  g.Noise)
Group.link('rustQuestionMark',   g.Special)
Group.link('rustSelf',           g.String)
Group.link('rustSuper',          g.Noise)
Group.link('rustTrait',          g.Noise)

Group.link('poCommentSources',   g.Comment)

Group.link('shArithRegion',      g.Noise)
Group.link('shArithmetic',       g.Normal)
Group.link('shCmdSubRegion',     g.Noise)
Group.link('shCommandSub',       g.Normal)
Group.link('shDeref',            g.Noise)
Group.link('shOption',           g.Normal)
Group.link('shQuote',            g.String)

Group.link('pugClassChar',       g.Noise)
Group.link('pugPipeChar',        g.Noise)
Group.link('pugPipedText',       g.String)
Group.link('pugTagInlineText',   g.String)

Group.link('gitcommitHeader',    g.Normal)
Group.link('gitcommitFile',      g.String)
