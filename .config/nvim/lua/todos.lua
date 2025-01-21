local M = {}
local utils = require "helper"

---@description Get todos from a file
---@param path string
---@return table
local function get_todos(path)
  if not utils.check_file(path) then
    ---@diagnostic disable-next-line: return-type-mismatch
    return nil
  end
  local file = io.open(path, "r")
  local lines = {}
  ---@diagnostic disable-next-line: need-check-nil
  for line in file:lines() do
    table.insert(lines, line)
  end
  if #lines == 0 then
    vim.notify("failed to get todos", 3)
  end
  return lines
end

---@description: Update the window with todos
M.show_todos = function()
  local path = utils.vault_path()
  local todoList = get_todos(path)
  if not todoList then
    return
  end
  local window = utils.create_win()
  vim.api.nvim_buf_set_lines(window.buf, 0, 0, false, { "------ Todos ------" })
  vim.api.nvim_buf_set_lines(window.buf, 1, 1, false, todoList)

  --- Keymaps for buffer/win
  vim.keymap.set({ "n" }, "q", function()
    vim.api.nvim_win_close(window.win, true)
  end, { buffer = window.buf })

  vim.keymap.set({ "n" }, "e", function()
    vim.api.nvim_win_close(window.win, true)
    vim.cmd("e" .. path)
  end, { buffer = window.buf })
end

return M
