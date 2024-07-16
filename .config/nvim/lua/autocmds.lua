-- Autocmds
vim.api.nvim_create_user_command("ToggleTodo", function()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = vim.fn.getline(cursor[1])
  local delimiter
  for i = 0, #line do
    if line:sub(i, i) == "[" then
      delimiter = i
      break
    end
  end
  local today = os.date "%Y-%m-%d"
  local newline = line:sub(0, delimiter) .. "x" .. line:sub(delimiter + 2, #line) .. " " .. "✅ " .. today
  vim.api.nvim_set_current_line(newline)
end, {})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == "" then
      require("telescope.builtin").find_files()
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  pattern = "*",
  desc = "Highlight selection on yank",
  callback = function()
    vim.highlight.on_yank { timeout = 200, visual = true }
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("vertical_help", { clear = true }),
  pattern = "help",
  callback = function()
    vim.bo.bufhidden = "unload"
    vim.cmd.wincmd "L"
    vim.cmd.wincmd "="
  end,
})

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format { async = true, lsp_fallback = true, range = range }
end, { range = true })

vim.api.nvim_create_user_command("Today", function()
  local todos = require "helper"
  local current_machine = vim.fn.hostname()
  local home = vim.fn.getenv "HOME"
  if current_machine == "nixos" then
    todos.show_todos "/mnt/c/Users/migue/Documents/wiki/Streaming/Topics.md"
  else
    todos.show_todos(home .. "/Obsidian/wiki/Work/2024.md")
  end
end, {})

vim.api.nvim_create_user_command("TodayOpen", function()
  local todos = require "helper"
  local current_machine = vim.fn.hostname()
  local user = vim.fn.getenv "LOGNAME"
  if current_machine == "nixos" then
    todos.edit "/mnt/c/Users/migue/Documents/wiki/Streaming/Topics.md"
  else
    todos.edit("/Users/" .. user .. "/Obsidian/wiki/Work/2024.md")
  end
end, {})

vim.api.nvim_create_user_command("TodayClose", function()
  local todos = require "helper"
  todos.hide_todos()
end, {})
