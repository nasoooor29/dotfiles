vim.keymap.set("n", "<leader>cht", "<cmd>Hardtime toggle<CR>", {
	desc = "hardtime toggle",
})
vim.keymap.set("n", "<leader>cm", "<cmd>messages clear<CR>", {
	desc = "clear messages",
})

-- Function to clear the quickfix list

vim.keymap.set("n", "<leader>cq", function()
	vim.fn.setqflist({})
end, {
	desc = "hardtime toggle",
})

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "" })
vim.keymap.set("n", "ff", "<cmd>GoIfErr<CR>", { desc = "if err != nil" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "" })

vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "" })
