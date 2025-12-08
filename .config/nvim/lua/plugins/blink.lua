return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "giuxtaposition/blink-cmp-copilot",
        "mikavilpas/blink-ripgrep.nvim"
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
            default = { "lazydev", "lsp", "path", "snippets", "buffer", "copilot", "ripgrep" },
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
            },
        },
        signature = { enabled = true },
    },
}
