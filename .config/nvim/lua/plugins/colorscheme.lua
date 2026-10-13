return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    local function system_background()
      if vim.fn.has "mac" == 1 then
        local result = vim.system({ "defaults", "read", "-g", "AppleInterfaceStyle" }):wait()
        return result.code == 0 and "dark" or "light"
      end

      if vim.fn.executable "gsettings" == 1 then
        local result = vim.system({
          "gsettings",
          "get",
          "org.gnome.desktop.interface",
          "color-scheme",
        }):wait()
        return result.stdout:match "dark" and "dark" or "light"
      end

      return "dark"
    end

    vim.o.background = system_background()

    require("tokyonight").setup {
      style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
      sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      dim_inactive = false, -- dims inactive windows
      lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
    }
    vim.cmd [[colorscheme tokyonight]]
  end,
}
