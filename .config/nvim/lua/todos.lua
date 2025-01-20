local utils = require "helper"
local win, buf = utils.create_win()

---@description Get todos from a file
---@param path string
---@return table
local function get_todos(path)
  if not utils.check_file(path) then
    return {}
  end
  local file = io.open(path, "r")
  local lines = {}
  for line in file:lines() do
    table.insert(lines, line)
  end
  return lines
end

---@description: Update the window with todos
local function show_todos()
  local path = utils.vault_path()
  local todoList = get_todos(path)
  vim.api.nvim_buf_set_lines(buf, 0, 0, false, { "Todos" })
  for _, line in ipairs(todoList) do
    vim.api.nvim_buf_set_lines(buf, -1, -1, false, { line })
  end
end

vim.keymap.set("n", "q", function()
  vim.api.nvim_win_close(win.id, true)
end)

show_todos()
