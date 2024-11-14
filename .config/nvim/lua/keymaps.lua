-- Keymaps
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Force HJKL --
keymap("n", "<UP>", "<NOP>", opts)
keymap("n", "<DOWN>", "<NOP>", opts)
keymap("n", "<LEFT>", "<NOP>", opts)
keymap("n", "<RIGHT>", "<NOP>", opts)
keymap("v", "<UP>", "<NOP>", opts)
keymap("v", "<DOWN>", "<NOP>", opts)
keymap("v", "<LEFT>", "<NOP>", opts)
keymap("v", "<RIGHT>", "<NOP>", opts)

-- Utils --
keymap("n", "<C-s>", "<Esc>:w<CR>", opts)
keymap("n", "<C-q>", "<Esc>:q<CR>", opts)

-- Exit and quit all buffers
keymap("c", "Q", "<cmd>qa!<cr>", opts)

-- Smooth Scrolling at the middle
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Copy and Paste without system clipboard clunkiness
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to clipboard" })
vim.keymap.set(
  { "n", "v", "x" },
  "<leader>Y",
  '"+yy',
  { noremap = true, silent = true, desc = "Yank line to clipboard" }
)
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from clipboard" })

local mappings = {
  -- Visual
  { "<leader>tt", "<cmd>ToggleTodo<cr>", desc = "[T]oggle Todo", mode = "v" },
  -- Normal
  { "<leader>G", "<cmd>Git<cr>", group = "Git", mode = "n" },
  { "<leader>g", "<cmd>Neogit<cr>", desc = "NeoGit", mode = "n" },
  { "<leader>L", "<cmd>Lazy<cr>", group = "Core", mode = "n" },
  { "<leader>M", "<cmd>Mason<cr>", group = "Core", mode = "n" },
  { "<leader>Z", "<cmd>ZenMode<cr>", desc = "Zen Mode", mode = "n" },
  {
    "<leader>sh",
    "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>",
    desc = "[S]how Inlay Hints",
    mode = "n",
  },
  {
    "<leader>ba",
    "<cmd>BufferLineCloseOthers<cr>",
    desc = "[B]uffer Close All But Current",
    mode = "n",
  },
  { "<leader>gb", "<cmd>Git blame<cr>", desc = "Blame", mode = "v" },
  { "<leader>gd", "<cmd>Git diffthis<cr>", desc = "Diff", mode = "v" },
  { "<leader>hc", "<cmd>Telescope commands<cr>", desc = "Commands", mode = "n" },
  { "<leader>hh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags", mode = "n" },
  { "<leader>hk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps", mode = "n" },
  { "<leader>i", "<cmd>nohlsearch<cr>", hidden = true, mode = "n" },
  { "<leader>tt", "<cmd>ToggleTodo<cr>", desc = "[T]oggle Todo", mode = "n" },
}
