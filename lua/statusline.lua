local gl = require('galaxyline')

local gls = gl.section
gl.short_line_list = {'defx', 'packager', 'vista', 'NvimTree', 'nerdtree'}

local palette = {
    white   = { gui='#A8A8A8', cterm=248 },
    light   = { gui='#8A8A8A', cterm=245 },
    grey    = { gui='#808080', cterm=244 },
    dark    = { gui='#585858', cterm=240 },
    darker  = { gui='#444444', cterm=238 },
    base    = { gui='#303030', cterm=236 },
    black   = { gui='#262626', cterm=235 },
    backgnd = { gui='#1C1C1C', cterm=234 },

    cactus  = { gui='#87AF5F', cterm=107 }, -- limegreen
    moss    = { gui='#5F875F', cterm=065 }, -- darkgreen
    flower  = { gui='#AFAF87', cterm=144 }, -- yellow
    fruit   = { gui='#D787AF', cterm=175 }, -- pink
    purple  = { gui='#8787AF', cterm=103 },
    cyan    = { gui='#87AFD7', cterm=110 },
    brown   = { gui='#AF875F', cterm=137 },
    blue    = { gui='#5F87AF', cterm=067 },
    red     = { gui='#D75F5F', cterm=167 },
    orange  = { gui='#D7875F', cterm=173 },
}

-- initialize all colors from palette
local c = {}
for key, value in pairs(palette) do
    c[key] = value.gui
end

-- Local helper functions
local function get_current_file_name()
    local file = vim.fn.expand'%:t'
    if vim.bo.readonly and vim.bo.filetype ~= 'help' then
        file = file..' '
    end
    if not vim.bo.readonly and vim.bo.modified then
        file = file..' [+]'
    end
    return '  '..file
end

local function get_current_mode()
    local modes = {
        n      = { alias = 'NORMAL',   color = c.white  },
        i      = { alias = 'INSERT',   color = c.cyan   },
        c      = { alias = 'COMMAND',  color = c.light   },
        v      = { alias = 'VISUAL',   color = c.cactus },
        V      = { alias = 'V-LINE',   color = c.cactus },
        [''] = { alias = 'V-BLOCK',  color = c.cactus },
        r      = { alias = 'REPLACE',  color = c.red    },
        R      = { alias = 'REPLACE',  color = c.red    },
        t      = { alias = 'TERMINAL', color = c.purple },
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

-- Left side
gls.left[1] = {
    ViMode = {
        provider = get_current_mode,
        highlight = {c.light, c.base}
    }
}
gls.left[2] = {
    FileName = {
        provider = get_current_file_name,
        highlight = {c.light, c.base},
    }
}
gls.left[3] = {
    Space = {
        provider = function() return '   ' end,
        highlight = {c.light, c.base},
    }
}
gls.left[4] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = ' ',
        highlight = {c.red, c.base},
    }
}
gls.left[5] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = ' ',
        highlight = {c.orange, c.base},
    }
}
gls.left[6] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = ' ',
        highlight = {c.blue, c.base},
    }
}

-- Right side
gls.right[1] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = function()
            local vcs = require('galaxyline.provider_vcs')
            return vcs.check_git_workspace()
        end,
        icon = ' ',
        highlight = {c.light, c.base}
    }
}
gls.right[2] = {
    BufferType = {
        provider = 'FileTypeName',
        condition = function()
            return vim.bo.filetype ~= ''
        end,
        highlight = {c.light, c.base},
        separator = ' ',
        separator_highlight = {c.light, c.base}
    }
}
gls.right[3] = {
    PerCent = {
        provider = 'LinePercent',
        highlight = {c.light, c.base},
        separator = ' ',
        separator_highlight = {c.light, c.base}
    }
}

-- Short status line
gls.short_line_left[1] = {
    FileName = {
        provider = get_current_file_name,
        highlight = {c.light, c.base}
    }
}

-- Force manual load so that nvim boots with a status line
gl.load_galaxyline()
