local M = {}

---@description: Checks if a file exists
---@param path string
---@return boolean|nil error
M.check_file = function(path)
  if vim.fn.filereadable(path) == 0 then
    vim.notify("File does not exist", 3)
    return false
  end
  return true
end

return M
