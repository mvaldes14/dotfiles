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
      path = 0,
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
        local buf_clients = vim.lsp.get_active_clients()
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
      color = { gui = "bold", fg = "#c0caf5", },
      padding = 1,
    }

    local formatter = {
      function()
        if vim.lsp.buf.formatting or vim.lsp.format then
          return
        else
          local config = require "formatter.config"
          local fmts = config.formatters_for_filetype(vim.bo.filetype)
          local buf_fmts = {}
          for _, fmt_config in ipairs(fmts) do
            local current_fmt = fmt_config()
            if current_fmt.exe ~= "sed" then
              table.insert(buf_fmts, current_fmt.exe)
            end
          end
          if buf_fmts[1] == nil then
            return "Formatter: None"
          end
          return "Formatter: " .. table.concat(buf_fmts, ", ")
        end
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
      color = { fg = "#c0caf5"},
      padding = 1,
    }

    local diagnostics = {
      "diagnostics",

      -- Table of diagnostic sources, available sources are:
      --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
      -- or a function that returns a table as such:
      --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
      sources = { "nvim_diagnostic", "coc" },

      -- Displays diagnostics for the defined severity types
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
        theme = "catppuccin",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "NvimTree" },
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
      extensions = {},
    }
  end,
}
