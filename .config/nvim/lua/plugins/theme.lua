return {
	-- themes i may wanna switch to later
	"akinsho/horizon.nvim",
	"folke/tokyonight.nvim",
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		dependencies = {
			{
				{

					"xiyaowong/transparent.nvim",
					config = function()
						require("transparent").clear_prefix("Oil")
						require("transparent").clear_prefix("MiniStatusline")
						require("transparent").clear_prefix("Avante")
						require("transparent").clear_prefix("Float")
						require("transparent").setup({
							-- table: additional groups that should be cleared
							extra_groups = {
								"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
							},
						})
					end,
				},
			},
		},

		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")

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
	},
}
