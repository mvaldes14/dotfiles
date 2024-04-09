local M = {}

--@description: Create a floating window with todos
local function create_win()
  local col = vim.o.columns
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    style = "minimal",
    border = "single",
    width = 50,
    height = 10,
    row = 1,
    col = col - 30,
  })
  vim.wo[win].wrap = false
  return buf
end

--@param path: string
--@description: Get todos from a file
local function get_todos(path)
  local file = io.open(path, "r")
  if not file then
    print "File not found"
    return
  end
  local lines = {}
  for line in file:lines() do
    table.insert(lines, line)
  end
  return lines
end

--@description: Update the window with todos
--@param lines: table
local function update_win(lines)
  local buf = create_win()
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
  for _, line in ipairs(lines) do
    vim.api.nvim_buf_set_lines(buf, -1, -1, false, { line })
  end
end

--@class: Todos
--@description: Show todos in a floating window
--@param: path string
M.show_todos = function(path)
  if not path then
    print "No path provided"
    return
  end
  local lines = get_todos(path)
  update_win(lines)
end

--@class: Todos
--@description: Hide the todos window
M.hide_todos = function()
  local win = vim.api.nvim_list_wins()
  -- Close the last window created
  vim.api.nvim_win_close(win[#win], true)
end

M.edit = function(path)
  vim.cmd("e " .. path)
end

return M
