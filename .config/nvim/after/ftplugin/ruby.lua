local path = vim.fn.getcwd()

if string.match(path, "chef") then
  vim.bo.filetype = "chef"
  --- Keybinds for chef only
  vim.keymap.set("n", "<leader>cf", "<cmd>ChefFindAny<cr>", { desc = "Chef Find" })
  vim.keymap.set("n", "<leader>cs", "<cmd>ChefFindAnySplit<cr>", { desc = "Chef Find (Split)" })
end
