local M = {}

---@description: Create a floating window and a buffer
---@param title string
M.create_win = function(title)
  local col = vim.o.columns
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    style = "minimal",
    border = "rounded",
    width = 50,
    height = 15,
    row = 1,
    col = col - 30,
    title = title,
    title_pos = "center"
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
  if userid == "nixos" then
    return "/mnt/c/migue/Obsidian/wiki/02-Areas/Work/2025.md"
  end
  if M.check_work() then
    return string.format("/Users/%s/Obsidian/wiki/02-Areas/Work/2025.md", userid)
  end
  return string.format("/home/mvaldes/Obsidian/wiki/02-Areas/Work/2025.md", userid)
end

return M
