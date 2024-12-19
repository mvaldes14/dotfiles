return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        panel = {
          enabled = false,
          suggestion = {
            enabled = false,
            auto_trigger = true,
            debounce = 75,
            keymap = {
              accept = "<C-y>",
              accept_word = false,
              accept_line = false,
              next = "<M-]>",
              prev = "<M-[>",
              dismiss = "<C-]>",
            },
          },
          copilot_node_command = "node",   -- Node.js version must be > 16.x
          server_opts_overrides = {},
          filetypes = {
            ["."] = true,
          },
        },
      }
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cond = function()
      return require("helper").check_work()
    end,
  }
}
