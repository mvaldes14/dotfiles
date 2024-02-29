return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  opts = {
    disable_frontmatter = true,
    workspaces = {
      {
        name = "wiki",
        path = "~/Obsidian/wiki",
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    new_notes_location = "current_dir",
    note_id_func = function(title)
      return title
    end,
    templates = {
      subdir = "_templates",
    },
    ui = {
      enable = false,
    },
  },
}
