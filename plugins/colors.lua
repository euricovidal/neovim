if not as then return end
local P = as.ui.palette
local L = as.ui.lsp.colors
local highlight = as.highlight

local function general_overrides()
  highlight.all({
    { Dim = { foreground = { from = 'Normal', attr = 'bg', alter = 25 } } },
    { VertSplit = { fg = { from = 'Comment' } } },
    { WinSeparator = { fg = { from = 'Comment' } } },
    { mkdLineBreak = { clear = true } },
    { Directory = { inherit = 'Keyword', bold = true } },
    { URL = { inherit = 'Keyword', underline = true } },
    { ErrorMsg = { background = 'NONE' } },
    { Cursor = { fg = 'NONE' } },
    { UnderlinedTitle = { bold = true, underline = true } },
    -----------------------------------------------------------------------------//
    -- Commandline
    -----------------------------------------------------------------------------//
    { MsgArea = { background = { from = 'Normal', alter = -10 } } },
    { MsgSeparator = { link = 'MsgArea' } },
    -----------------------------------------------------------------------------//
    -- Floats
    -----------------------------------------------------------------------------//
    { NormalFloat = { bg = { from = 'Normal', alter = -15 } } },
    { FloatBorder = { bg = { from = 'Normal', alter = -15 }, fg = { from = 'Comment' } } },
    { FloatTitle = { inherit = 'FloatBorder', reverse = true, bold = true, bg = 'white' } },
    { Pmenu = { link = 'NormalFloat' } },
    { Pmenu = { link = 'NormalFloat' } },
    -----------------------------------------------------------------------------//
    { CodeBlock = { background = { from = 'Normal', alter = 30 } } },
    { markdownCode = { link = 'CodeBlock' } },
    { markdownCodeBlock = { link = 'CodeBlock' } },
    {
      CurSearch = {
        background = { from = 'String', attr = 'fg' },
        foreground = 'white',
        bold = true,
      },
    },
    { CursorLineNr = { inherit = 'CursorLine', bold = true } },
    { CursorLineSign = { link = 'CursorLine' } },
    { FoldColumn = { background = 'bg' } },
    { TermCursor = { ctermfg = 'green', foreground = 'royalblue' } },
    -- Add undercurl to existing spellbad highlight
    { SpellBad = { undercurl = true, background = 'NONE', foreground = 'NONE', sp = 'green' } },
    { SpellRare = { undercurl = true } },
    { PmenuSbar = { background = P.grey } },
    { PmenuThumb = { background = { from = 'Comment', attr = 'fg' } } },
    -----------------------------------------------------------------------------//
    -- Diff
    -----------------------------------------------------------------------------//
    { DiffAdd = { background = '#26332c', foreground = 'NONE', underline = false } },
    { DiffDelete = { background = '#572E33', foreground = '#5c6370', underline = false } },
    { DiffChange = { background = '#273842', foreground = 'NONE', underline = false } },
    { DiffText = { background = '#314753', foreground = 'NONE' } },
    { diffAdded = { link = 'DiffAdd' } },
    { diffChanged = { link = 'DiffChange' } },
    { diffRemoved = { link = 'DiffDelete' } },
    { diffBDiffer = { link = 'WarningMsg' } },
    { diffCommon = { link = 'WarningMsg' } },
    { diffDiffer = { link = 'WarningMsg' } },
    { diffFile = { link = 'Directory' } },
    { diffIdentical = { link = 'WarningMsg' } },
    { diffIndexLine = { link = 'Number' } },
    { diffIsA = { link = 'WarningMsg' } },
    { diffNoEOL = { link = 'WarningMsg' } },
    { diffOnly = { link = 'WarningMsg' } },
    -----------------------------------------------------------------------------//
    -- colorscheme overrides
    -----------------------------------------------------------------------------//
    { Comment = { italic = true } },
    { Type = { italic = true, bold = true } },
    { Include = { italic = true, bold = false } },
    { QuickFixLine = { inherit = 'PmenuSbar', foreground = 'NONE', italic = true } },
    -- Neither the sign column or end of buffer highlights require an explicit background
    -- they should both just use the background that is in the window they are in.
    -- if either are specified this can lead to issues when a winhighlight is set
    { SignColumn = { background = 'NONE' } },
    { EndOfBuffer = { background = 'NONE' } },
    { StatusColSep = { fg = { from = 'WinSeparator' }, bg = { from = 'CursorLine' } } },
    ------------------------------------------------------------------------------//
    --  Semantic tokens
    ------------------------------------------------------------------------------//
    { ['@lsp.type.parameter'] = { italic = true, foreground = { from = 'Normal' } } },
    { ['@lsp.type.variable'] = { link = '@variable' } },
    { ['@lsp.typemod.variable.global'] = { bold = true, inherit = '@constant.builtin' } },
    { ['@lsp.typemod.variable.defaultLibrary'] = { italic = true } },
    { ['@lsp.typemod.variable.readonly.typescript'] = { clear = true } },
    { ['@lsp.typemod.operator.injected'] = { link = '@operator' } },
    { ['@lsp.typemod.keyword'] = { link = '@keyword' } },
    { ['@lsp.typemod.string.injected'] = { link = '@string' } },
    { ['@lsp.typemod.variable.injected'] = { link = '@variable' } },
    -----------------------------------------------------------------------------//
    -- Treesitter
    -----------------------------------------------------------------------------//
    { ['@keyword.return'] = { italic = true, foreground = { from = 'Keyword' } } },
    { ['@variable'] = { clear = true } },
    { ['@parameter'] = { italic = true, bold = true, foreground = 'NONE' } },
    { ['@error'] = { foreground = 'fg', background = 'NONE' } },
    { ['@text.diff.add'] = { link = 'DiffAdd' } },
    { ['@text.diff.delete'] = { link = 'DiffDelete' } },
    { ['@text.title.markdown'] = { underdouble = true } },
    -----------------------------------------------------------------------------//
    -- LSP
    -----------------------------------------------------------------------------//
    { LspCodeLens = { inherit = 'Comment', bold = true, italic = false } },
    { LspCodeLensSeparator = { bold = false, italic = false } },
    {
      LspReferenceText = {
        underdotted = true,
        background = 'NONE',
        special = { from = 'Comment', attr = 'fg' },
      },
    },
    {
      LspReferenceRead = {
        underdotted = true,
        background = 'NONE',
        special = { from = 'Comment', attr = 'fg' },
      },
    },
    -- This represents when a reference is assigned which is more interesting than regular
    -- occurrences so should be highlighted more distinctly
    {
      LspReferenceWrite = {
        bold = true,
        italic = true,
        background = 'NONE',
        underline = true,
        special = { from = 'Comment', attr = 'fg' },
      },
    },
    -- Base colours
    { DiagnosticHint = { foreground = L.hint } },
    { DiagnosticError = { foreground = L.error } },
    { DiagnosticWarning = { foreground = L.warn } },
    { DiagnosticInfo = { foreground = L.info } },
    -- Underline
    { DiagnosticUnderlineError = { undercurl = true, sp = L.error, foreground = 'none' } },
    { DiagnosticUnderlineHint = { undercurl = true, sp = L.hint, foreground = 'none' } },
    { DiagnosticUnderlineWarn = { undercurl = true, sp = L.warn, foreground = 'none' } },
    { DiagnosticUnderlineInfo = { undercurl = true, sp = L.info, foreground = 'none' } },
    -- Virtual Text
    { DiagnosticVirtualTextInfo = { bg = { from = 'DiagnosticInfo', attr = 'fg', alter = -70 } } },
    { DiagnosticVirtualTextHint = { bg = { from = 'DiagnosticHint', attr = 'fg', alter = -70 } } },
    { DiagnosticVirtualTextWarn = { bg = { from = 'DiagnosticWarn', attr = 'fg', alter = -80 } } },
    {
      DiagnosticVirtualTextError = { bg = { from = 'DiagnosticError', attr = 'fg', alter = -80 } },
    },
    -- Sign column line
    { DiagnosticSignInfoLine = { inherit = 'DiagnosticVirtualTextInfo', fg = 'NONE' } },
    { DiagnosticSignHintLine = { inherit = 'DiagnosticVirtualTextHint', fg = 'NONE' } },
    { DiagnosticSignErrorLine = { inherit = 'DiagnosticVirtualTextError', fg = 'NONE' } },
    { DiagnosticSignWarnLine = { inherit = 'DiagnosticVirtualTextWarn', fg = 'NONE' } },
    -- Sign column signs
    { DiagnosticSignInfo = { fg = { from = 'DiagnosticInfo' } } },
    { DiagnosticSignHint = { fg = { from = 'DiagnosticHint' } } },
    {
      DiagnosticSignWarn = {
        bg = { from = 'DiagnosticVirtualTextWarn' },
        fg = { from = 'DiagnosticWarn' },
      },
    },
    {
      DiagnosticSignError = {
        bg = { from = 'DiagnosticVirtualTextError' },
        fg = { from = 'DiagnosticError' },
      },
    },
    -- Sign column line number
    { DiagnosticSignWarnNr = { link = 'DiagnosticSignWarn' } },
    { DiagnosticSignInfoNr = { link = 'DiagnosticSignInfo' } },
    { DiagnosticSignHintNr = { link = 'DiagnosticSignHint' } },
    { DiagnosticSignErrorNr = { link = 'DiagnosticSignError' } },
    -- Sign column cursor line number
    { DiagnosticSignWarnCursorNr = { inherit = 'DiagnosticSignWarn', bold = true } },
    { DiagnosticSignInfoCursorNr = { inherit = 'DiagnosticSignInfo', bold = true } },
    { DiagnosticSignHintCursorNr = { inherit = 'DiagnosticSignHint', bold = true } },
    { DiagnosticSignErrorCursorNr = { inherit = 'DiagnosticSignError', bold = true } },
    -- Floating windows
    { DiagnosticFloatingWarn = { link = 'DiagnosticWarn' } },
    { DiagnosticFloatingInfo = { link = 'DiagnosticInfo' } },
    { DiagnosticFloatingHint = { link = 'DiagnosticHint' } },
    { DiagnosticFloatingError = { link = 'DiagnosticError' } },
  })
end

local function set_sidebar_highlight()
  highlight.all({
    { PanelDarkBackground = { bg = { from = 'Normal', alter = -42 } } },
    { PanelDarkHeading = { inherit = 'PanelDarkBackground', bold = true } },
    { PanelBackground = { background = { from = 'Normal', alter = -8 } } },
    { PanelHeading = { inherit = 'PanelBackground', bold = true } },
    { PanelWinSeparator = { inherit = 'PanelBackground', fg = { from = 'WinSeparator' } } },
    { PanelStNC = { link = 'PanelWinSeparator' } },
    { PanelSt = { background = { from = 'Visual', alter = -20 } } },
  })
end

local sidebar_fts = {
  'packer',
  'flutterToolsOutline',
  'undotree',
  'Outline',
  'dbui',
  'neotest-summary',
  'pr',
}

local function on_sidebar_enter()
  vim.opt_local.winhighlight:append({
    Normal = 'PanelBackground',
    EndOfBuffer = 'PanelBackground',
    StatusLine = 'PanelSt',
    StatusLineNC = 'PanelStNC',
    SignColumn = 'PanelBackground',
    VertSplit = 'PanelVertSplit',
    WinSeparator = 'PanelWinSeparator',
  })
end

local function colorscheme_overrides()
  local overrides = {
    ['doom-one'] = {
      { ['@namespace'] = { foreground = P.blue } },
      { CursorLineNr = { foreground = { from = 'Keyword' } } },
      { LineNr = { background = 'NONE' } },
      { NeoTreeIndentMarker = { link = 'Comment' } },
      { NeoTreeRootName = { bold = true, italic = true, foreground = 'LightMagenta' } },
    },
    ['horizon'] = {
      -----------------------------------------------------------------------------------------------
      --- TODO: upstream these highlights to horizon.nvim
      -----------------------------------------------------------------------------------------------
      { Normal = { fg = '#C1C1C1' } },
      -----------------------------------------------------------------------------------------------
      { NormalNC = { inherit = 'Normal' } },
      { WinSeparator = { fg = '#353647' } },
      { Constant = { bold = true } },
      { NonText = { fg = { from = 'Comment' } } },
      { LineNr = { background = 'NONE' } },
      { TabLineSel = { background = { from = 'SpecialKey', attr = 'fg' } } },
      { VisibleTab = { background = { from = 'Normal', alter = 40 }, bold = true } },
      { ['@variable'] = { fg = { from = 'Normal' } } },
      { ['@constant.comment'] = { inherit = 'Constant', bold = true } },
      { ['@constructor.lua'] = { inherit = 'Type', italic = false, bold = false } },
      { ['@lsp.type.parameter'] = { foreground = { from = 'Normal' } } },
      { PanelBackground = { link = 'Normal' } },
      { PanelWinSeparator = { inherit = 'PanelBackground', fg = { from = 'WinSeparator' } } },
      { PanelHeading = { bg = 'bg', bold = true, fg = { from = 'Normal', alter = -30 } } },
      { PanelDarkBackground = { background = { from = 'Normal', alter = -25 } } },
      { PanelDarkHeading = { inherit = 'PanelDarkBackground', bold = true } },
    },
  }
  local hls = overrides[vim.g.colors_name]
  if not hls then return end

  highlight.all(hls)
end

local function user_highlights()
  general_overrides()
  set_sidebar_highlight()
  colorscheme_overrides()
end

as.augroup('UserHighlights', {
  event = 'ColorScheme',
  command = function() user_highlights() end,
}, {
  event = 'FileType',
  pattern = sidebar_fts,
  command = function() on_sidebar_enter() end,
})
