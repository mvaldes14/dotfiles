return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "giuxtaposition/blink-cmp-copilot",
    "mikavilpas/blink-ripgrep.nvim",
    'Kaiser-Yang/blink-cmp-git',
  },
  version = "v0.*",
  opts = {
    keymap = { preset = "default" },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    cmdline = {
      enabled = false,
    },
    term = {
      enabled = false,
    },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer", "copilot", "ripgrep", "git" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true,
        },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
          opts = {},
        },
        git = {
          module = 'blink-cmp-git',
          name = 'Git',
          opts = {},
          enabled = function()
            return vim.tbl_contains({ 'git', 'markdown', 'gitcommit' }, vim.bo.filetype)
          end
        },
      },
    },
    signature = { enabled = true },
  },
}
