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
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    note_id_func = function(title)
      return title
    end,
    new_notes_location = "00-Inbox",
    notes_subdir = "00-Inbox",
    disable_frontmatter = true,
    templates = {
      folder = "_templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
  },
}
