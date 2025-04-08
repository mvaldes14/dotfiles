return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "giuxtaposition/blink-cmp-copilot",
    {
      "saghen/blink.compat",
      lazy = true,
      version = "*",
      opts = {
        sources = {
          compat = { "obsidian", "obsidian_new", "obsidian_tags" },
        },
      },
    },
  },
  version = "v0.*",
  opts = {
    keymap = { preset = "default" },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "copilot", "cmdline", "obsidian", "obsidian_tags", "obsidian_new" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true,
        },
        obsidian = {
          name = "obsidian",
          module = "blink.compat.source"
        },
        obsidian_new = {
          name = "obsidian_new",
          module = "blink.compat.source"
        },
        obsidian_tags = {
          name = "obsidian_tags",
          module = "blink.compat.source"
        }
      },
    },
    signature = { enabled = true },
  },
}
