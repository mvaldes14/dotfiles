return {
  "ThePrimeagen/harpoon",
  event = "BufEnter",
  config = function()
    local mark = require "harpoon.mark"
    local ui = require "harpoon.ui"
    vim.keymap.set("n", "<leader>ml", ui.toggle_quick_menu, { desc = "Toggle Harpoon Menu" })
    vim.keymap.set("n", "<leader>ma", mark.add_file, { desc = "Add File to Harpoon" })
    vim.keymap.set("n", "<leader>1", function()
      ui.nav_file(1)
    end, { desc = "Navigate to Harpoon File 1" })
    vim.keymap.set("n", "<leader>2", function()
      ui.nav_file(2)
    end, { desc = "Navigate to Harpoon File 2" })
    vim.keymap.set("n", "<leader>3", function()
      ui.nav_file(3)
    end, { desc = "Navigate to Harpoon File 3" })
    vim.keymap.set("n", "<leader>4", function()
      ui.nav_file(4)
    end, { desc = "Navigate to Harpoon File 4" })
  end,
}
