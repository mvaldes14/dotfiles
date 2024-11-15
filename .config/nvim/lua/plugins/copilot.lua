return {
  {
    "zbirenbaum/copilot.lua",
    keys = {
      { "<leader>ap", "<cmd>Copilot panel open<cr>", desc = "Copilot Panel" },
    },
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
          layout = {
            position = "right", -- | top | left | right
            ratio = 0.4,
          },
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
      -- require("copilot_cmp").setup {}
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = { show_help = false },
    cond = function()
      return require("helper").check_work()
    end,
  }
}
