-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, desc = "Exit insert mode" })

-- Move Lines
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("v", "J", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "K", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

map("n", "<leader>w", ":w<cr>", { desc = "Save" })
map("n", "<leader>q", ":q<cr>", { desc = "Quit" })
map("v", "<leader>w", ":w<cr>", { desc = "Save" })
map("v", "<leader>q", ":q<cr>", { desc = "Quit" })

-- Clipboard (parity with .vimrc)
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("v", "<leader>p", '"_dP', { desc = "Paste without overwriting register" })

-- Select all
map("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })

-- Move to last char of the line
vim.keymap.set({ "n", "x", "o" }, "-", "g_")
