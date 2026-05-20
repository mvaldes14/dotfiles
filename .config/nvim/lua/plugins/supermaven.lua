return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  config = function()
    require("supermaven-nvim").setup {
      ignore_filetypes = { "snacks_dashboard", "TelescopePrompt", "oil" },
      disable_inline_completion = false,
      disable_keymaps = true, -- handled in blink config so <C-y> can accept either
    }
  end,
}
