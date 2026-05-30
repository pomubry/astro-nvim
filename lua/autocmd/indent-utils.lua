local M = {}
local function is_telescope_open()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == "TelescopePrompt" then return true end
  end
  return false
end

function M.apply_ts_indent_if_blank()
  local buf = vim.api.nvim_get_current_buf()
  local lnum = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.api.nvim_buf_get_lines(buf, lnum - 1, lnum, false)[1]
  if line ~= "" then return end

  -- get indent from indentexpr (Tree-sitter or fallback)
  local old_lnum = vim.v.lnum
  vim.v.lnum = lnum

  local picker = require "snacks.picker"
  local is_picker_closed = picker.current and picker.current.closed
  local indexntexpr = vim.bo.indentexpr

  if (indexntexpr == "" and not is_picker_closed) or is_telescope_open() then return end

  local indent = vim.fn.eval(indexntexpr)
  vim.v.lnum = old_lnum
  if indent > 0 then vim.api.nvim_buf_set_lines(buf, lnum - 1, lnum, false, { string.rep(" ", indent) }) end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("$", true, false, true), "n", true)
end

return M
