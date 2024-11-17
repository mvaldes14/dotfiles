return {
  {
    "zbirenbaum/copilot.lua",
    cond = function()
      return require("helper").check_work()
    end,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
          },
          suggestion = {
            enabled = true,
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
          copilot_node_command = "node", -- Node.js version must be > 16.x
          server_opts_overrides = {},
        }
      }
    end
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = { show_help = false },
    cond = function()
      return require("helper").check_work()
    end,
  }
}
