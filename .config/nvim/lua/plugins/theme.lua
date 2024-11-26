return {
	"vague2k/huez.nvim",
	-- if you want registry related features, uncomment this
	-- import = "huez-manager.import"
	branch = "stable",
	event = "UIEnter",
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

	import = "huez-manager.import",
	config = function()
		require("huez").setup({})
		local pickers = require("huez.pickers")

		vim.keymap.set("n", "<leader>thh", pickers.themes, { desc = "Huez themes" })
		vim.keymap.set("n", "<leader>thf", pickers.favorites, { desc = "Huez favorites" })
		vim.keymap.set("n", "<leader>thl", pickers.live, { desc = "Huez live" })
		vim.keymap.set("n", "<leader>the", pickers.ensured, { desc = "Huez ensured" })

		vim.cmd.colorscheme("horizon")

		local accent = "#e95678"
		local hl = vim.api.nvim_set_hl

		hl(0, "MiniTablineCurrent", { fg = accent })
		hl(0, "CursorLineNr", { fg = accent })
		hl(0, "FloatBorder", { fg = accent })
	end,
}
