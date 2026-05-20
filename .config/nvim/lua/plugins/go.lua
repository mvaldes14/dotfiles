return {
  {
    "ray-x/go.nvim",
    ft = { "go", "gomod", "gosum", "gowork", "gotmpl" },
    dependencies = {
      "ray-x/guihua.lua",
    },
    build = ':lua require("go.install").update_all_sync()',
    config = function()
      require("go").setup {
        lsp_cfg = false,
        lsp_keymaps = false,
        lsp_inlay_hints = { enable = false },
        dap_debug = true,
        dap_debug_keymap = false,
        trouble = false,
        luasnip = false,
        icons = false,
      }
    end,
  },
}
