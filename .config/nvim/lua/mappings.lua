vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.set("n", "<leader>fee", ":lua MiniFiles.open()<CR>", { desc = "open file explorer" })
-- vim.keymap.set("n", "<leader>fec", ":lua MiniFiles.close()<CR>", { desc = "close file explorer" })
--
vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "]c", ":Gitsigns next_hunk", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "[c", ":Gitsigns prev_hunk", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

