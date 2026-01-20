return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
        "leoluz/nvim-dap-go",
        "jbyuki/one-small-step-for-vimkind",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap_ui = require "dapui"
        local dap = require "dap"
        local dapgo = require "dap-go"

        -- Setup for plugins
        dap_ui.setup()
        dapgo.setup()

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
            all_frames = false,    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
        }


        -- Adapter configurations
        -- LUA
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

        -- GO
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
                name = "Debug", -- debug the file
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
                name = "Debug (Arguments)", -- debug the package with args
                request = "launch",
                program = "${file}",
                args = dapgo.get_arguments,
            },
            {
                type = "delve",
                name = "Debug CLI (with Args)",
                request = "launch",
                program = "${workspaceFolder}", -- set to workspace folder for CLI apps
                args = dapgo.get_arguments,
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
