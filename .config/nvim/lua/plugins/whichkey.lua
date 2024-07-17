return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require "which-key"
    wk.setup {
      preset = "modern",
      filter = function(mapping)
        return mapping.desc and mapping.desc ~= ""
      end,
      plugins = {
        marks = false, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = false, -- adds help for operators like d, y, ...
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      layout = {
        align = "center",
      },
      icons = {
        mappings = false,
      },
      expand = function(node)
        return not node.desc
      end,
    }

    local mappings = {
      -- Visual
      {
        "<leader>a",
        group = "GPT",
        {
          "<leader>ae",
          "<cmd>ChatGPTRun explain_code<cr>",
          desc = "GPT Explain Code",
          mode = "v",
        },
        {
          "<leader>ao",
          "<cmd>ChatGPTRun optimize_code<cr>",
          desc = "GPT Optimize Code",
          mode = "v",
        },
        {
          "<leader>ar",
          "<cmd>ChatGPTRun refactor_code<cr>",
          desc = "GPT Refactor Code",
          mode = "v",
        },
      },
      { "<leader>tt", "<cmd>ToggleTodo<cr>", desc = "[T]oggle Todo", mode = "v" },
      -- Normal
      { "<leader>G", "<cmd>Git<cr>", desc = "NeoGit", mode = "n" },
      { "<leader>L", "<cmd>Lazy<cr>", desc = "Lazy", mode = "n" },
      { "<leader>M", "<cmd>Mason<cr>", desc = "Mason", mode = "n" },
      { "<leader>Z", "<cmd>ZenMode<cr>", desc = "Zen Mode", mode = "n" },
      {
        "<leader>sh",
        "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>",
        desc = "[S]how Inlay Hints",
        mode = "n",
      },
      {
        "<leader>ba",
        "<cmd>BufferLineCloseOthers<cr>",
        desc = "[B]uffer Close All But Current",
        mode = "n",
      },
      { "<leader>bc", "<cmd>bd<cr>", desc = "[B]uffer Close Current", mode = "n" },
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "Blame", mode = "v" },
      { "<leader>gd", "<cmd>Git diffthis<cr>", desc = "Diff", mode = "v" },
      { "<leader>hc", "<cmd>Telescope commands<cr>", desc = "Commands", mode = "n" },
      { "<leader>hh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags", mode = "n" },
      { "<leader>hk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps", mode = "n" },
      { "<leader>i", "<cmd>nohlsearch<cr>", hidden = true, mode = "n" },
      { "<leader>tt", "<cmd>ToggleTodo<cr>", desc = "[T]oggle Todo", mode = "n" },
    }
    wk.add(mappings)
  end,
}
