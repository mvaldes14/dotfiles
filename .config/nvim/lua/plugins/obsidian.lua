return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  opts = {
    disable_frontmatter = false,
    workspaces = {
      {
        name = "wiki",
        path = "~/Obsidian/wiki",
      },
      {
        name = "notes",
        path = "~/Obsidian/notes",
      },
      {
        name = "tasks",
        path = "~/Obsidian/tasks",
      },
    },
    detect_cwd = true,
    completion = {
      nvim_cmp = true,
      min_chars = 2,
      new_notes_location = "current_dir",
      prepend_note_id = false,
      prepend_note_path = true,
      use_path_only = false,
    },
    yaml_parser = "native"
  },
}
