return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  opts = {
    workspaces = {
      {
        name = "wiki",
        path = "/mnt/c/Users/migue/Documents/wiki",
      },
      {
        name = "wiki",
        path = "~/Obsidian/wiki",
      },
    },
  },
}
