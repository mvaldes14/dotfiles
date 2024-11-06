return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  opts = {
    workspaces = {
      {
        name = "wiki",
        path = function()
          if vim.fn.hostname() == "nixos" then
            return "/mnt/c/Users/migue/Documents/wiki"
          else
            return "~/Obsidian/wiki"
          end
        end,
      },
    },
    note_id_func = function(title)
      return title
    end,
    note_frontmatter_func = function(_)
      return {}
    end,
    -- completion = {
    -- Set to false to disable completion.
    -- nvim_cmp = true,
    -- Trigger completion at 2 chars.
    -- min_chars = 2,
    -- },
    new_notes_location = "current_dir",
    disable_frontmatter = true,
    templates = {
      folder = "_templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
  },
}
