local M = {}

---@description: Create a floating window and a buffer
---@param opts table
---@return table
local function create_float(opts)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)
  local buf

  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    style = "minimal",
    border = "rounded",
    width = width,
    height = height,
    row = row,
    col = col,
    title = "Terminal",
    title_pos = "center",

  })

  return { buf = buf, win = win }
end

local state = {
  buf = -1,
  win = -1
}

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

---@description: Open a floating terminal
M.float_term = function()
  if not vim.api.nvim_win_is_valid(state.win) then
    state = create_float(state)
    if vim.bo[state.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.win)
  end

  --- Keymaps for buffer/win
  vim.keymap.set({ "t" }, "<esc><esc>", "<c-\\><c-n>:q<cr>", { buffer = state.buf })
end

return M
