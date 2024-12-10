return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	dependencies = {
		{
			"akinsho/horizon.nvim",
			opts = {
				plugins = {
					cmp = true,
					indent_blankline = true,
					nvim_tree = true,
					telescope = true,
					which_key = true,
					barbar = true,
					notify = true,
					symbols_outline = true,
					neo_tree = true,
					gitsigns = true,
					crates = true,
					hop = true,
					navic = true,
					quickscope = true,
					flash = true,
				},
			},
		},
	},

	config = function()
		-- vim.cmd.colorscheme("horizon")
		vim.cmd.colorscheme("catppuccin-mocha")

		local accent = "#cba6f7"
		local hl = vim.api.nvim_set_hl

		hl(0, "MiniTablineCurrent", { fg = accent })
		hl(0, "CursorLineNr", { fg = accent })
		hl(0, "FloatBorder", { fg = accent, bg = "#cba6f7" })
	end,
}
