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
  local newline = line:sub(0, delimiter) .. "x" .. line:sub(delimiter + 2, #line)
  vim.api.nvim_set_current_line(newline)
end, {})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == "." then
      require("telescope.builtin").find_files()
    end
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if
            #vim.api.nvim_list_wins() == 1
            and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
            and is_modified_buffer_open(vim.fn.getbufinfo({ bufmodified = 1 })) == false
        then
            vim.cmd("quit")
        end
    end,
})
