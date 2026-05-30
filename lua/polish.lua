-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

local indent_utils = require "autocmd/indent-utils"
local no_autoscroll_utils = require "autocmd/no-autoscroll-utils"

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = indent_utils.apply_ts_indent_if_blank,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = no_autoscroll_utils.restore_win_view,
})

vim.api.nvim_create_autocmd("BufLeave", {
  callback = no_autoscroll_utils.save_win_view,
})