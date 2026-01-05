return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "giuxtaposition/blink-cmp-copilot",
        "mikavilpas/blink-ripgrep.nvim",
        'Kaiser-Yang/blink-cmp-git',
    },
    version = "1.*",
    opts = {
        keymap = { preset = "default" },
        appearance = {
            nerd_font_variant = "mono",
        },
        signature = { window = { border = 'single' } },
        completion = {
            menu = {
                border = 'single',
            },
            ghost_text = { enabled = true },
        },
        cmdline = {
            enabled = false,
        },
        term = {
            enabled = false,
        },
        sources = {
            default = { "buffer", "lazydev", "lsp", "path", "snippets", "copilot", "ripgrep", "git" },
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
    },
}
