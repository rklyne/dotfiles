-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- stuff I use all the time that bugs me
vim.keymap.set("n", "s", "cl")
vim.keymap.set("n", "Y", "yy")
vim.keymap.set("n", "<leader>q<CR>", ":q<CR>", { desc = "quit" })
vim.keymap.set("n", "<leader>w<CR>", ":w<CR>", { desc = "write file" })

-- stuff that's overridden that I don't want
vim.keymap.del("n", "H")
vim.keymap.del("n", "L")

-- LSP stuff
vim.keymap.set("n", "\\t", vim.lsp.buf.hover)
