-- Core keymaps. Leader is set to space in options.lua.

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Save / quit
keymap("n", "<leader>w", "<cmd>w<CR>", opts)
keymap("n", "<leader>q", "<cmd>q<CR>", opts)

-- Window navigation
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)

-- Resize windows
keymap("n", "<leader>w-", "<C-w>-", opts)
keymap("n", "<leader>w+", "<C-w>+", opts)
keymap("n", "<leader>w<", "<C-w><", opts)
keymap("n", "<leader>w>", "<C-w>>", opts)

-- Move lines in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Smart newline without leaving normal mode
keymap("n", "<A-j>", "<cmd>m .+1<CR>==", opts)
keymap("n", "<A-k>", "<cmd>m .-2<CR>==", opts)

-- Clear search highlight
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)