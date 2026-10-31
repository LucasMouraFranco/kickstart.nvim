-- OpenCode Dark, matching the fleet's Ghostty and editor themes.
-- Tokyo Night supplies maintained highlight groups for the installed plugins.
local p = {
  bg = '#0a0a0a',
  panel = '#141414',
  raised = '#1e1e1e',
  selection = '#323232',
  border = '#484848',
  muted = '#808080',
  subtext = '#b5b5b5',
  text = '#eeeeee',
  peach = '#fab283',
  purple = '#9d7cd8',
  red = '#e06c75',
  green = '#7fd88f',
  yellow = '#e5c07b',
  orange = '#f5a742',
  blue = '#5c9cf5',
  cyan = '#56b6c2',
  white = '#ffffff',
}

vim.o.termguicolors = true

---@diagnostic disable-next-line: missing-fields
require('tokyonight').setup {
  style = 'night',
  styles = { comments = { italic = false } },
  on_colors = function(c)
    local colors = {
      bg = p.bg,
      bg_dark = p.panel,
      bg_dark1 = p.bg,
      bg_float = p.panel,
      bg_highlight = p.panel,
      bg_popup = p.panel,
      bg_sidebar = p.panel,
      bg_statusline = p.panel,
      bg_visual = p.selection,
      bg_search = p.selection,
      fg = p.text,
      fg_dark = p.subtext,
      fg_float = p.text,
      fg_sidebar = p.subtext,
      fg_gutter = p.muted,
      comment = p.muted,
      dark3 = p.muted,
      dark5 = p.subtext,
      black = p.panel,
      terminal_black = p.muted,
      border = p.border,
      border_highlight = p.peach,
      blue = p.blue,
      blue0 = p.blue,
      blue1 = p.cyan,
      blue2 = p.cyan,
      blue5 = p.cyan,
      blue6 = p.cyan,
      blue7 = p.blue,
      cyan = p.cyan,
      teal = p.cyan,
      green = p.green,
      green1 = p.green,
      green2 = p.green,
      magenta = p.purple,
      magenta2 = p.purple,
      purple = p.purple,
      orange = p.orange,
      red = p.red,
      red1 = p.red,
      yellow = p.yellow,
      error = p.red,
      warning = p.orange,
      info = p.cyan,
      hint = p.cyan,
      todo = p.peach,
      git = { add = p.green, change = p.orange, delete = p.red, ignore = p.muted },
      diff = { add = '#20303b', delete = '#37222c', change = p.panel, text = p.selection },
      rainbow = { p.blue, p.yellow, p.green, p.cyan, p.purple, p.peach },
      terminal = {
        black = p.panel,
        black_bright = p.muted,
        red = p.red,
        red_bright = '#fd7e87',
        green = p.green,
        green_bright = '#96f7a7',
        yellow = p.yellow,
        yellow_bright = p.orange,
        blue = p.blue,
        blue_bright = '#82b4fb',
        magenta = p.purple,
        magenta_bright = '#b38ff4',
        cyan = p.cyan,
        cyan_bright = '#68d0dd',
        white = p.text,
        white_bright = p.white,
      },
    }
    for name, color in pairs(colors) do
      c[name] = color
    end
  end,
  on_highlights = function(h)
    local syntax = {
      Function = p.peach,
      Identifier = p.red,
      Keyword = p.purple,
      Statement = p.purple,
      PreProc = p.purple,
      Type = p.yellow,
      Constant = p.orange,
      Number = p.orange,
      Boolean = p.orange,
      Operator = p.cyan,
      Delimiter = p.text,
      ['@function.builtin'] = p.peach,
      ['@keyword.function'] = p.purple,
      ['@constructor'] = p.yellow,
      ['@variable'] = p.red,
      ['@variable.member'] = p.red,
      ['@variable.parameter'] = p.red,
      ['@property'] = p.red,
      ['@type.builtin'] = p.yellow,
      ['@punctuation.bracket'] = p.text,
      ['@punctuation.delimiter'] = p.text,
      ['@markup.heading'] = p.purple,
      ['@markup.link'] = p.peach,
    }
    for name, color in pairs(syntax) do
      h[name] = { fg = color }
    end
    for _, name in ipairs { 'Cursor', 'lCursor', 'CursorIM' } do
      h[name] = { fg = p.bg, bg = p.white }
    end
    h.CursorLineNr = { fg = p.peach, bold = true }
    h.PmenuSel = { fg = p.text, bg = p.selection }
    h.Search = { fg = p.text, bg = p.selection }
    h.IncSearch = { fg = p.bg, bg = p.peach }
  end,
}

require('tokyonight').load { style = 'night' }
vim.g.colors_name = 'opencode-dark'
