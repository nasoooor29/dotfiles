return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	dependencies = {
		{
			"akinsho/horizon.nvim",
			"folke/tokyonight.nvim",
		},
	},

	config = function()
		-- vim.cmd.colorscheme("horizon")
		vim.cmd.colorscheme("catppuccin-mocha")
		vim.cmd.colorscheme("tokyonight-night")

		local accent = "#cba6f7"
		vim.diagnostic.config({
			float = {
				scope = "cursor",
				border = "rounded",
				max_width = 80, -- Set the maximum width for the floating window
			},
		})
		vim.api.nvim_set_hl(0, "MiniTablineCurrent", { fg = accent })
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = accent })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = accent })
	end,
}
