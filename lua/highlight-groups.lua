local function set_highlights()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalSB", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#191724" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#191724" })
  vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "#524b5f" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
  vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
  vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "none", bold = true, italic = true })
  vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { fg = "#a9b1d6", bold = true })
end

set_highlights()
vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", callback = set_highlights })

vim.opt.winblend = 5

