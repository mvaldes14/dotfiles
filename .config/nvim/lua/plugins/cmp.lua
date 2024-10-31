-- return {
--   "hrsh7th/nvim-cmp",
--   dependencies = {
--     "hrsh7th/cmp-nvim-lsp",
--     "hrsh7th/cmp-nvim-lua",
--     "hrsh7th/cmp-buffer",
--     "hrsh7th/cmp-path",
--     "hrsh7th/cmp-cmdline",
--     "L3MON4D3/LuaSnip",
--     "saadparwaiz1/cmp_luasnip",
--     "rafamadriz/friendly-snippets",
--     "onsails/lspkind-nvim",
--   },
--   cmd = "InsertEnter",
--   config = function()
--     local cmp = require "cmp"
--     local luasnip = require "luasnip"
--     local lspkind = require "lspkind"
--     local validation = require "helper"
--
--     require("luasnip.loaders.from_vscode").lazy_load()
--     require("luasnip.loaders.from_vscode").load { paths = "./snippets" }
--     require("luasnip").filetype_extend("typescript", { "javascript" })
--
--     local has_words_before = function()
--       if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
--         return false
--       end
--       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--       return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match "^%s*$" == nil
--     end
--
--     cmp.setup {
--       preselect = cmp.PreselectMode.None,
--       snippet = {
--         expand = function(args)
--           luasnip.lsp_expand(args.body) -- For `luasnip` users.
--         end,
--       },
--       window = {
--         documentation = cmp.config.window.bordered(),
--         completion = cmp.config.window.bordered(),
--       },
--       mapping = {
--         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-f>"] = cmp.mapping.scroll_docs(4),
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<C-e>"] = cmp.mapping.abort(),
--         ["<CR>"] = cmp.mapping.confirm { select = true },
--         ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
--         ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
--         ["<Tab>"] = vim.schedule_wrap(function(fallback)
--           if cmp.visible() and has_words_before() then
--             cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
--           elseif luasnip.expand_or_jumpable() then
--             luasnip.expand_or_jump()
--           else
--             fallback()
--           end
--         end),
--       },
--       formatting = {
--         format = lspkind.cmp_format {
--           with_text = true,
--           menu = {
--             coipilot = "[Copilot]",
--             nvim_lsp = "[LSP]",
--             nvim_lua = "[Lua]",
--             luasnip = "[Snip]",
--             buffer = "[Buffer]",
--             path = "[Path]",
--           },
--         },
--       },
--       sources = cmp.config.sources {
--         { name = "copilot" },
--         { name = "cody" },
--         { name = "nvim_lsp" },
--         { name = "nvim_lua" },
--         { name = "luasnip", keyword_length = 2, max_item_count = 5 },
--         { name = "buffer",  keyword_length = 5, max_item_count = 10 },
--       },
--       confirm_opts = {
--         behavior = cmp.ConfirmBehavior.Replace,
--         select = false,
--       },
--       experimental = {
--         ghost_text = true,
--         native_menu = false,
--       },
--       sorting = {
--         priority_weight = 2,
--         comparators = {
--           cmp.config.compare.offset,
--           cmp.config.compare.exact,
--           cmp.config.compare.score,
--           cmp.config.compare.recently_used,
--           cmp.config.compare.locality,
--           cmp.config.compare.kind,
--           cmp.config.compare.sort_text,
--           cmp.config.compare.length,
--           cmp.config.compare.order,
--         },
--       },
--     }
--
--     cmp.setup.cmdline({ "/", "?" }, {
--       mapping = cmp.mapping.preset.cmdline(),
--       sources = {
--         { name = "buffer" },
--       },
--     })
--
--     cmp.setup.cmdline(":", {
--       mapping = cmp.mapping.preset.cmdline(),
--       sources = cmp.config.sources({
--         { name = "path" },
--       }, {
--         { name = "cmdline" },
--       }),
--     })
--
--     cmp.setup.filetype("sql", {
--       sources = {
--         { name = "vim-dadbod-completion" },
--         { name = "buffer" },
--       },
--     })
--   end,
-- }
--
return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',

  -- use a release tag to download pre-built binaries
  version = 'v0.*',
  -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- see the "default configuration" section below for full documentation on how to define
    -- your own keymap. when defining your own, no keybinds will be assigned automatically.
    keymap = "super-tab",

    highlight = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = true,
    },
    -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'normal',

    -- experimental auto-brackets support
    -- accept = { auto_brackets = { enabled = true } }

    -- experimental signature help support
    -- trigger = { signature_help = { enabled = true } }
  }
}
