return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "leoluz/nvim-dap-go",
    "jbyuki/one-small-step-for-vimkind",
    "suketa/nvim-dap-ruby",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    local dap_ui = require "dapui"
    local dap = require "dap"
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Keymaps
    keymap("n", "<F1>", "<cmd> lua require('dap').step_back()<cr>", opts)
    keymap("n", "<F2>", "<cmd> lua require('dap').step_into()<cr>", opts)
    keymap("n", "<F3>", "<cmd> lua require('dap').step_over()<cr>", opts)
    keymap("n", "<F4>", "<cmd> lua require('dap').step_out()<cr>", opts)
    keymap("n", "<F5>", "<cmd> lua require('dap').continue()<cr>", opts)
    keymap("n", "<leader>dr", "<cmd> lua require('dap').repl.open()<cr>", opts)
    keymap("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
    keymap("n", "<leader>dk", "<cmd> lua require'dap.ui.widgets'.hover()<cr>", opts)
    keymap("n", "<leader>do", "<cmd> lua require'dapui'.toggle()<cr>", opts)
    keymap("n", "<leader>dl", "<cmd> lua require'osv'.run_this()<cr>", opts)
    keymap("n", "<leader>dB", function()
      require("dap").set_breakpoint(vim.fn.input "[DAP] Condition > ")
    end)

    -- Virtual Text
    require("nvim-dap-virtual-text").setup {
      enabled = true,

      -- DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, DapVirtualTextForceRefresh
      enabled_commands = false,

      -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
      highlight_changed_variables = true,
      highlight_new_as_changed = true,

      -- prefix virtual text with comment string
      commented = false,

      show_stop_reason = true,

      -- experimental features:
      virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
      all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    }

    -- UI
    local _ = dap_ui.setup {
      -- You can change the order of elements in the sidebar
      sidebar = {
        elements = {
          -- Provide as ID strings or tables with "id" and "size" keys
          {
            id = "scopes",
            size = 0.75, -- Can be float or integer > 1
          },
          { id = "watches", size = 00.25 },
        },
        size = 50,
        position = "left", -- Can be "left" or "right"
      },

      tray = {
        elements = {},
        size = 15,
        position = "bottom", -- Can be "bottom" or "top"
      },
    }

    -- Adapter configurations
    require("dap-ruby").setup()
    require("dap-go").setup()

    dap.configurations.lua = {
      {
        type = "nlua",
        request = "attach",
        name = "Attach to running Neovim instance",
      },
    }

    dap.adapters.nlua = function(callback, config)
      callback { type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 }
    end

    dap.adapters.delve = {
      type = "server",
      port = "${port}",
      executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
      },
    }

    -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    dap.configurations.go = {
      {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}",
      },
      {
        type = "delve",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}",
      },
      {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
      },
    }

    -- Open UI on Debug
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dap_ui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dap_ui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dap_ui.close()
    end
  end,
}
