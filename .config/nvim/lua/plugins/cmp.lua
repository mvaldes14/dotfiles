return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets", "giuxtaposition/blink-cmp-copilot" },
  version = "v0.*",
  opts = {
    keymap = { preset = "default" },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "copilot" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },
    signature = { enabled = true },
  },
  opts_extend = { "sources.default" },
}
