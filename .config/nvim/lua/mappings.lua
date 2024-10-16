vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>fee", ":Neotree<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>dd", ":NoiceDismiss<CR>", {})
