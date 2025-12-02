-- Options
local options = {
  sw = 4,                                    -- Indentation 4 spaces
  ts = 4,                                    -- same as above
  et = true,                                 -- same as above
  spell = false,                             -- disable spell check, only needed in markdown files
  spelllang = "en_us",                       -- set spell check language
  backup = false,                            -- creates a backup file
  clipboard = "unnamedplus",                 -- allows neovim to access the system clipboard
  cmdheight = 1,                             -- more space in the neovim command line for displaying messages
  completeopt = 'menuone,noselect,noinsert', -- mostly just for cmp
  fileencoding = "utf-8",                    -- the encoding written to a file
  hlsearch = true,                           -- highlight all matches on previous search pattern
  ignorecase = true,                         -- ignore case in search patterns
  smartcase = true,                          -- smart case
  mouse = "a",                               -- allow the mouse to be used in neovim
  winblend = 0,                              -- floating window transparency
  showmode = false,                          -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                           -- always show tabs
  smartindent = true,                        -- make indenting smarter again
  splitbelow = true,                         -- force all horizontal splits to go below current window
  splitright = true,                         -- force all vertical splits to go to the right of current window
  swapfile = false,                          -- creates a swapfile
  termguicolors = true,                      -- set term gui colors (most terminals support this)
  undofile = true,                           -- enable persistent undo
  updatetime = 300,                          -- faster completion (4000ms default)
  timeoutlen = 500,                          -- time to wait for a mapped sequence to complete (in milliseconds)
  writebackup = false,                       -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                          -- convert tabs to spaces
  shiftwidth = 2,                            -- the number of spaces inserted for each indentation
  tabstop = 2,                               -- insert 2 spaces for a tab
  cursorline = true,                         -- highlight the current line
  number = true,                             -- set numbered lines
  relativenumber = true,                     -- set relative numbered lines
  numberwidth = 4,                           -- set number column width to 2 {default 4}
  signcolumn = "yes",                        -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                              -- display lines as one long eine
  linebreak = true,                          -- line break for long lines
  guifont = "monospace:h17",                 -- the font used in graphical neovim applications
  foldlevelstart = 99,                       -- fold all folds by default
  foldcolumn = "1",                          -- show fold column
  foldtext = "",                             -- use default fold text
  foldmethod = "expr",                       -- set fold method to expression
  foldexpr = "nvim_treesitter#foldexpr()",   -- use treesitter for folding
  path = "**/*",                             -- search down into subfolders
  --pumborder = 'rounded',                     -- popup menu border
  pumheight = 15,                            -- popup menu height
  pumblend = 0,                              -- popup menu transparency
  wildignore = {                             -- ignore files and folders in file completion
    "node_modules",
    ".git/",
    "vendor",
    "coverage",
    "build",
    ".DS_Store"
  },
}
vim.opt.shortmess:append "c"
for k, v in pairs(options) do
  vim.opt[k] = v
end
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]

vim.opt.list = true -- show whitespace characters
vim.opt.listchars = {
  eol = " ",
  tab = "__",
  trail = "•",
  extends = "❯",
  precedes = "❮",
  nbsp = "ﰸ",
}
vim.opt.fillchars = {
  fold = " ",
  foldsep = " ",
  foldopen = "",
  foldclose = "",
  diff = "╱",
}

vim.diagnostic.config { virtual_text = true }
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
