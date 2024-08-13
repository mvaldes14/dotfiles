return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require "lualine"

    local mode = {
      "mode",
      icons_enabled = true,
      fmt = function(str)
        return str
      end,
    }

    local filetype = {
      "filetype",
      colored = true,
      icon = { align = "left" },
    }

    local branch = {
      "b:gitsigns_head",
      icons_enabled = true,
      icon = "",
    }

    local location = {
      "location",
      padding = 0,
    }

    local filename = {
      "filename",
      file_status = true,
      path = 1,
    }

    local treesitter = {
      function()
        local b = vim.api.nvim_get_current_buf()
        if next(vim.treesitter.highlighter.active[b]) then
          return ""
        end
        return ""
      end,
      colored = true,
    }

    local lsp = {
      function()
        local buf_clients = vim.lsp.get_clients()
        if next(buf_clients) == nil then
          return "LS Inactive"
        end
        local buf_client_names = {}

        -- add client
        for _, client in pairs(buf_clients) do
          table.insert(buf_client_names, client.name)
        end

        return "LSP: " .. table.concat(buf_client_names, ", ")
      end,
      color = { gui = "bold", fg = "#c0caf5" },
      padding = 1,
    }

    local formatter = {
      function()
        local bufr = vim.api.nvim_get_current_buf()
        local fmt = require("conform").list_formatters(bufr)

        for _, l in ipairs(fmt) do
          if l.available then
            return "Formatter: " .. l.name
          end
        end
        return "Formatter: N/A"
      end,
      color = { fg = "#c0caf5" },
      padding = 1,
    }

    local linter = {
      function()
        local lint = require("lint")._resolve_linter_by_ft
        local linter = lint(vim.bo.filetype)
        local buf_linters = {}

        for _, l in ipairs(linter) do
          table.insert(buf_linters, l)
        end
        if buf_linters[1] == nil then
          return "Lint: None"
        end
        return "Linter: " .. table.concat(buf_linters, ", ")
      end,
      color = { fg = "#c0caf5" },
      padding = 1,
    }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn", "info", "hint" },
      diagnostics_color = {
        -- Same values as the general color option can be used here.
        error = "DiagnosticError", -- Changes diagnostics' error color.
        warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
        info = "DiagnosticInfo", -- Changes diagnostics' info color.
        hint = "DiagnosticHint", -- Changes diagnostics' hint color.
      },
      symbols = { error = " ", warn = " " },
      colored = true, -- Displays diagnostics status in color if set to true.
      update_in_insert = false, -- Update diagnostics in insert mode.
      always_visible = false, -- Show diagnostics even if there are none.
    }

    lualine.setup {
      options = {
        icons_enabled = true,
        theme = "tokyonight",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = { diagnostics, filename },
        lualine_x = { treesitter, lsp, formatter, linter, filetype },
        lualine_y = { location },
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "oil", "lazy" },
    }
  end,
}
