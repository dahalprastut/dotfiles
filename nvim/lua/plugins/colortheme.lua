
require('nordic').setup {
  reduced_blue = true,
  bold_keywords = true,
  override = {
    Comment = { fg = '#7b88a1', italic = true },
    LineNr = { fg = '#7b88a1' },
    CursorLineNr = { fg = '#eceff4', bold = true },
    Visual = { bg = '#434c5e' },
  },
}

require ('nordic').load()
