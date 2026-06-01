return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "mikavilpas/blink-ripgrep.nvim",
    "Kaiser-Yang/blink-cmp-git",
    "Huijiro/blink-cmp-supermaven",
  },
  version = "1.*",
  opts = {
    keymap = {
      preset = "default",
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    signature = { window = { border = "single" } },
    completion = {
      menu = {
        border = "single",
      },
      ghost_text = { enabled = false },
    },
    cmdline = {
      enabled = false,
    },
    term = {
      enabled = false,
    },
    sources = {
      default = { "lsp", "path", "supermaven", "snippets", "buffer", "lazydev", "ripgrep", "git" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        supermaven = {
          name = "supermaven",
          module = "blink-cmp-supermaven",
          async = true,
        },
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
          opts = {},
        },
        git = {
          module = "blink-cmp-git",
          name = "Git",
          opts = {},
          enabled = function()
            return vim.tbl_contains({ "git", "markdown", "gitcommit" }, vim.bo.filetype)
          end,
        },
      },
    },
  },
}
