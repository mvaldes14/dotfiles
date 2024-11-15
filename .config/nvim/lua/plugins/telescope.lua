return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-github.nvim",
  },
  branch = "0.1.x",
  config = function()
    require("telescope").setup {
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
        file_ignore_patterns = {
          "^node_modules/",
          "^.git/",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        grep_string = {
          additional_args = function()
            return { "--hidden", "--glob", "!**/.git/*" }
          end,
        },
        live_grep = {
          additional_args = function()
            return { "--hidden", "--glob", "!**/.git/*" }
          end,
        },
      },
      extensions = {
        undo = {
          use_delta = true,
          use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
          side_by_side = false,
          entry_format = "state #$ID, $STAT, $TIME",
          mappings = {
            i = {
              ["<cr>"] = require("telescope-undo.actions").yank_additions,
              ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
              ["<C-cr>"] = require("telescope-undo.actions").restore,
            },
          },
        },
        file_browser = {
          hijack_netwr = true,
          hidden = { file_browser = true },
        },
      },
    }

    require("telescope").load_extension "undo"
    require("telescope").load_extension "file_browser"
    require("telescope").load_extension "gh"
  end,
}
