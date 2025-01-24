local M = {}

---@description: Create a floating window and a buffer
---@param title string
M.create_win = function(title, type)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)

  -- Calculate the position to center the window
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)
  if type == "todo" then
    width = 50
    height = 15
    col = col - 30
    row = 1
  end
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    style = "minimal",
    border = "rounded",
    width = width,
    height = height,
    row = row,
    col = col,
    title = title,
    title_pos = "center",
  })
  vim.wo[win].wrap = false
  return { buf = buf, win = win }
end

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

---@description: Checks if the current system is my work computer
---@return boolean
M.check_work = function()
  if vim.fn.hostname() == "MACG7YVXHYFWG" then
    return true
  end
  return false
end

---@description: Get the path to the vault
---@return string
M.vault_path = function()
  local userid = vim.fn.getenv "USER"
  return string.format("/Users/%s/Obsidian/wiki/02-Areas/Work/2025.md", userid)
end

M.float_term = function(title, command)
  if not title then
    title = "Terminal"
  end
  if not command then
    command = vim.o.shell
  end
  local window = M.create_win(title)
  vim.api.nvim_win_set_option(window.win, "winblend", 0)
  vim.api.nvim_buf_set_option(window.buf, "bufhidden", "wipe")

  -- vim.cmd.terminal(command)
  vim.fn.termopen(command)
  --- Keymaps for buffer/win
  vim.keymap.set({ "n" }, "q", function()
    vim.api.nvim_win_close(window.win, true)
  end, { buffer = window.buf })
end

return M
