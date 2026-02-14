-- Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require "keymaps"
require "autocmds"
require "usercmds"
require "options"

require("lazy").setup {
  spec = {
    { import = "plugins" },
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

-- Enable LSPS
vim.lsp.enable {
  "lua_ls",
  "gopls",
  "terraformls",
  "astro",
  "pyright",
  "ruff",
  "ansiblels",
  "jsonnet_ls",
  "tailwindcss",
  "marksman",
  "ltex",
  "rust_analyzer",
  "templ",
  "htmx",
  "jsonlls",
  "nixd",
  "ts_ls",
  "yamlls",
}
