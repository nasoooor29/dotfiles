return {

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
		},
		opts = {
			kind = "floating",
		},
	},
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {},
		-- NOTE: shortcuts PLZ
	},
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = function()
			-- vim.api.nvim_set_hl(0, "CurrentCustom", { bg = "#89b4fa", fg = "#1e1e2e" })
			-- vim.api.nvim_set_hl(0, "IncomingCustom", { bg = "#f38ba8", fg = "#1e1e2e" })

			vim.api.nvim_set_hl(0, "CurrentCustom", { fg = "#7daea3", bg = "#404946" })
			vim.api.nvim_set_hl(0, "IncomingCustom", { fg = "#7daea3", bg = "#542937" })

			require("git-conflict").setup({
				default_mappings = false,
				default_commands = true,
				disable_diagnostics = true,
				list_opener = "copen",
				highlights = {
					incoming = "IncomingCustom",
					current = "CurrentCustom",
				},
			})

			local function choose_ours()
				vim.cmd("GitConflictChooseOurs")
				vim.cmd("GitConflictNextConflict")
			end
			local function choose_theirs()
				vim.cmd("GitConflictChooseTheirs")
				vim.cmd("GitConflictNextConflict")
			end

			vim.keymap.set("n", "co", choose_ours)
			vim.keymap.set("n", "ct", choose_theirs)
		end,
	},
}
