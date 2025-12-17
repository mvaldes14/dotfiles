-- User commands
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

-- vim.api.nvim_create_user_command("Format", function(args)
--   local range = nil
--   if args.count ~= -1 then
--     local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
--     range = {
--       start = { args.line1, 0 },
--       ["end"] = { args.line2, end_line:len() },
--     }
--   end
--   require("conform").format { async = true, lsp_fallback = true, range = range }
-- end, { range = true })

vim.api.nvim_create_user_command("Floaterm", function()
  local utils = require "helper"
  utils.float_term()
end, {})
