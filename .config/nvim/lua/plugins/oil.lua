return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	config = function()
		vim.keymap.set("n", "<leader>fe", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
		vim.keymap.set("n", "<leader>f", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
	end,
}
