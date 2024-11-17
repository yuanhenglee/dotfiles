-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jj", "<ESC>", { silent = true })

-- ctrl + f to search the word under the cursor
map("n", "<C-f>", 'viwy/<C-r>"<CR>', { silent = true })

-- alt + o to trigger :ClangdSwitchSourceHeader
map("n", "<A-o>", ":ClangdSwitchSourceHeader<CR>", { silent = true })
