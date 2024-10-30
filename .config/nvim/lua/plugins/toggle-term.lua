return {
	-- amongst your other plugins
	"akinsho/toggleterm.nvim",
	version = "*",

	config = function()
		require("toggleterm").setup({
			direction = "float",
		})

		vim.keymap.set("n", "<C-`>", "<cmd>ToggleTerm<CR>", { desc = "" })
		vim.keymap.set("t", "<C-`>", "<cmd>ToggleTerm<CR>", { desc = "" })
	end,
}
