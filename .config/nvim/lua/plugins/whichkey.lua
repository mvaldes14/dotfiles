return {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      plugins = {
        marks = false, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 10,
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = false, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = false, -- bindings for prefixed with g
        },
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
      },
      window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
      },
      ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      show_help = true, -- show help message on the command line when the popup is visible
      triggers = "auto", -- automatically setup triggers
      -- triggers = {"<leader>"} -- or specify a list manually
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
      },
    }
    local opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    local vopts = {
      mode = "v", -- VISUAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    local vmappings = {
      a = {
        name = "AI",
        e = { "<cmd>ChatGPTRun explain_code<cr>", "Explain Code" },
        o = { "<cmd>ChatGPTRun optimize_code<cr>", "Optimize Code" },
        r = { "<cmd>ChatGPTRun refactor_code<cr>", "Refactor Code" },
        s = { "<cmd>ChatGPTRun summarize_code<cr>", "Summarize Code" },
      },
      g = {
        name = "Git",
        b = { "<cmd>Git blame<cr>", "Blame" },
        d = { "<cmd>Git diff<cr>", "Diff" },
      },
    }

    local mappings = {
      ["c"] = { "<cmd>bd<CR>", "Close Buffer" },
      ["i"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
      ["d"] = { "<cmd>Trouble<CR>", "Diagnostics" },
      ["S"] = { "<cmd>Lazy<cr>", "Lazy" },
      ["M"] = { "<cmd>Mason<cr>", "Mason" },
      ["Z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },
      ["L"] = { "<cmd>LazyGit<cr>", "LazyGit" },
      ["x"] = { "<cmd>lua require('rest-nvim').run()<cr>", "Execute Request" },
      ["G"] = { "<cmd>Git<cr>", "Git" },
      b = {
        name = "Buffer",
        a = {"<cmd>BufferLineCloseOthers<cr>","Close All But Current"},
        s = {"<cmd>BufferLineSortByDirectory<cr>","Sort By Directory"}
      },
      h = {
        name = "Help",
        h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
        k = { "<cmd>Telescope keymaps<cr>", "Key Maps" },
      },
      o = {
        name = "Octo",
        l = { "<cmd>Octo pr list<cr>", "PR List" },
        s = { "<cmd>Octo review start<cr>", "Review Start" },
        e = { "<cmd>Octo review submit<cr>", "Review End" },
      },
      a = {
        name = "AI",
        t = { "<cmd>Copilot panel open<cr>", "Copilot Panel" },
        a = { "<cmd>ChatGptActAs<cr>", "Act As" },
        g = { "<cmd>ChatGptRun grammar_correction<cr>", "Grammar Correction" },
      },
    }
    require("which-key").register(mappings, opts)
    require("which-key").register(vmappings, vopts)
  end,
}
