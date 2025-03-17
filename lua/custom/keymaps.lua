vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Explore, { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>w", vim.cmd.write, { desc = "Save file" })
vim.keymap.set("n", "<leader>q", vim.cmd.exit, { desc = "Exit neovim" })
vim.keymap.set("n", "bd", vim.cmd.bdelete, { desc = "Buffer close" })
vim.keymap.set("n", "]b", vim.cmd.bnext, { desc = "Next Buffer" })
vim.keymap.set("n", "[b", vim.cmd.bprevious, { desc = "Previous Buffer" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "-", "ddkP")
vim.keymap.set("n", "+", "ddp")

-- Window focus commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
