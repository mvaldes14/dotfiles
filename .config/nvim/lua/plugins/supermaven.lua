return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  config = function()
    require("supermaven-nvim").setup {
      ignore_filetypes = { "snacks_dashboard", "TelescopePrompt", "oil" },
      disable_inline_completion = true, -- consumed by blink via blink-cmp-supermaven
      disable_keymaps = true,
      log_level = "off",
    }
  end,
}
