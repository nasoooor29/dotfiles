return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	dependencies = {
		{
			"akinsho/horizon.nvim",
			"folke/tokyonight.nvim",
			"xiyaowong/transparent.nvim"
		},
	},

	config = function()
		vim.cmd.colorscheme("catppuccin-mocha")
		require('transparent').clear_prefix('NeoTree')
		require('transparent').clear_prefix('MiniStatusline')
		vim.cmd("TransparentEnable")


		local accent = "#cba6f7"
		vim.diagnostic.config({
			float = {
				scope = "cursor",
				border = "rounded",
				max_width = 80,
			},
		})

		vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { fg = "white" })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { fg = "white" })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { fg = "white" })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { fg = "white" })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { fg = "white" })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeOther", { fg = "white" })
		vim.api.nvim_set_hl(0, "NotifyBackground", { bg = accent })
		vim.api.nvim_set_hl(0, "MiniTablineCurrent", { fg = accent })
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = accent })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = accent })
	end,
}
