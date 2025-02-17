return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = function()
		vim.api.nvim_set_hl(0, "CurrentCustom", { bg = "#89b4fa", fg = "#1e1e2e" })
		vim.api.nvim_set_hl(0, "IncomingCustom", { bg = "#f38ba8", fg = "#1e1e2e" })

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
}
