return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "mikavilpas/blink-ripgrep.nvim",
    "Kaiser-Yang/blink-cmp-git",
  },
  version = "1.*",
  opts = {
    keymap = {
      preset = "default",
      ["<C-y>"] = {
        function()
          local ok, preview = pcall(require, "supermaven-nvim.completion_preview")
          if ok and preview.has_suggestion() then
            preview.on_accept_suggestion()
            return true
          end
        end,
        "select_and_accept",
        "fallback",
      },
      ["<C-]>"] = {
        function()
          local ok, preview = pcall(require, "supermaven-nvim.completion_preview")
          if ok and preview.has_suggestion() then
            preview.on_dispose_inlay()
            return true
          end
        end,
        "fallback",
      },
      ["<C-j>"] = {
        function()
          local ok, preview = pcall(require, "supermaven-nvim.completion_preview")
          if ok and preview.has_suggestion() then
            preview.on_accept_suggestion_word()
            return true
          end
        end,
        "fallback",
      },
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
      default = { "buffer", "lazydev", "lsp", "path", "snippets", "ripgrep", "git" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
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
