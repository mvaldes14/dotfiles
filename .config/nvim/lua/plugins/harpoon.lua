return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { desc = desc })
    end

    map("<leader>ha", function() harpoon:list():add() end,                              "Harpoon: Add")
    map("<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,      "Harpoon: Menu")
    map("<leader>1",  function() harpoon:list():select(1) end,                          "Harpoon: 1")
    map("<leader>2",  function() harpoon:list():select(2) end,                          "Harpoon: 2")
    map("<leader>3",  function() harpoon:list():select(3) end,                          "Harpoon: 3")
    map("<leader>4",  function() harpoon:list():select(4) end,                          "Harpoon: 4")
    map("<leader>hn", function() harpoon:list():next() end,                             "Harpoon: Next")
    map("<leader>hp", function() harpoon:list():prev() end,                             "Harpoon: Prev")
  end,
}
