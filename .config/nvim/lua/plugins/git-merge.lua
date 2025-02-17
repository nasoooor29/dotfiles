return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = function()
		vim.api.nvim_set_hl(0, "CurrentCustom", { bg = "#89b4fa", fg = "#1e1e2e" })
		vim.api.nvim_set_hl(0, "IncomingCustom", { bg = "#f38ba8", fg = "#1e1e2e" })

		local gc = require("git-conflict")
		gc.setup({
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

		local custom_helpers = require("eb.utils.custom_helpers")
		local keymap_normal = custom_helpers.keymap_normal

		keymap_normal("co", choose_ours, "GitConflict", true, "choose ours, move to next conflict and refresh qflist")
		keymap_normal(
			"ct",
			choose_theirs,
			"GitConflict",
			true,
			"choose theirs, move to next conflict and refresh qflist"
		)
	end,
}

