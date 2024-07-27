M = {}

M.get_buf_dir = function()
  local current_buf = vim.api.nvim_buf_get_name(0)
  local current_buf_dir = vim.fn.fnamemodify(current_buf, ':h')
  return current_buf_dir
end

return M
