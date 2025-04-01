return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{
			-- NOTE: for configuration options refer to this link:
			-- https://github.com/MeanderingProgrammer/render-markdown.nvim/wiki
			"MeanderingProgrammer/render-markdown.nvim",
			opts = { file_types = { "markdown", "Avante" } },
			ft = { "markdown", "Avante" },
		},
		{
			"zbirenbaum/copilot-cmp",
			dependencies = {
				"zbirenbaum/copilot.lua",
			},
			config = function()
				require("copilot").setup({
					suggestion = { enabled = false },
					panel = { enabled = false },
				})
				-- require("copilot_cmp").setup()
			end,
		}
	},
	build = "make",
	opts = {
		provider = "copilot",
		hints = {
			enabled = true,
		},
		windows = {
			width = 40,
			sidebar_header = {
				enabled = false, -- true, false to enable/disable the header
			},
			input = {
				prefix = "> ",
				height = 4, -- Height of the input window in vertical layout
			},
			-- ask = {
			-- 	floating = true, -- Open the 'AvanteAsk' prompt in a floating window
			-- },
		},
	},

	keys = {
		{ "<leader>ava", ":AvanteClear<CR>:AvanteToggle<CR>", silent = true, desc = "avante: clear and toggle" },
	},
}
