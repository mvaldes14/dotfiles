return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require "which-key"
    wk.setup {
      preset = "helix",
      delay = 300,
      -- filter = function(mapping)
      --     return mapping.desc and mapping.desc ~= ""
      -- end,
      plugins = {
        marks = false,                -- shows a list of your marks on ' and `
        registers = true,             -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true,             -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 10,           -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = false,              -- adds help for operators like d, y, ...
          motions = false,                -- adds help for motions
          text_objects = false,           -- help for text objects triggered after entering an operator
          windows = true,                 -- default bindings on <c-w>
          nav = true,                     -- misc bindings to work with windows
          z = true,                       -- bindings for folds, spelling and others prefixed with z
          g = true,                       -- bindings for prefixed with g
        },
      },
      layout = {
        align = "center",
      },
      icons = {
        mappings = false,
      },
      expand = function(node)
        return not node.desc
      end,
    }
    wk.add {
      { "<leader>f", group = "Find" },           -- group
      { "<leader>s", group = "Search" },         -- group
      { "<leader>g", group = "Git" },            -- group
      { "<leader>O", group = "Obsidian" },       -- group
      { "<leader>x", group = "Utility" },        -- group
      { "<leader>t", group = "Todoist" },        -- group
      { "<leader>h", group = "Help" },           -- group
      { "<leader>X", group = "DB" },             -- group
      { "<leader>b", group = "Buffer" },         -- group
      { "<leader>o", group = "Opencode" },       -- group
    }
  end,
}
