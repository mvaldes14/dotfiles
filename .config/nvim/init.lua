-- Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
        "netrwPlugin",
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
  "pyright",
  "ruff",
  "bashls",
  "ansiblels",
  "helm_ls",
  "jsonnet_ls",
  "marksman",
  "ltex",
  "templ",
  "jsonlls",
  "nixd",
  "ts_ls",
  "yamlls",
}
