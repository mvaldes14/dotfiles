return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    legacy_commands = false,
    workspaces = {
      { name = "wiki", path = "/Users/mvaldes/Obsidian/wiki" },
    },
    completion = {
      blink = true,
      min_chars = 2,
    },
    ui = { enable = false }, -- render-markdown handles rendering
    daily_notes = {
      folder = "Logs",
      date_format = "%Y-%m-%d",
      template = nil,
    },
    notes_subdir = "Inbox",
    new_notes_location = "notes_subdir",
    templates = {
      folder = "Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
    frontmatter = {
      enabled = function(fname)
        return fname:match("^Logs/") == nil
      end,
    },
  },
  keys = {
    { "<leader>on", "<cmd>Obsidian new_from_template<cr>", desc = "Obsidian: New from template" },
    { "<leader>oo", "<cmd>Obsidian search<cr>", desc = "Obsidian: Search" },
    { "<leader>of", "<cmd>Obsidian quick_switch<cr>", desc = "Obsidian: Find note" },
    { "<leader>oh", "<cmd>Obsidian follow_link<cr>", desc = "Obsidian: Follow link" },
    { "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Obsidian: Backlinks" },
    { "<leader>ot", "<cmd>Obsidian today<cr>", desc = "Obsidian: Today" },
    { "<leader>oy", "<cmd>Obsidian yesterday<cr>", desc = "Obsidian: Yesterday" },
    { "<leader>oT", "<cmd>Obsidian tags<cr>", desc = "Obsidian: Tags" },
  },
}
