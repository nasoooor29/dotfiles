return {
	"gennaro-tedesco/nvim-possession",
	dependencies = {
		"ibhagwan/fzf-lua",
	},
	config = function()
		require("nvim-possession").setup({
			sessions = {
				sessions_path = "/home/nasoooor/.sessions/", -- folder to look for sessions, must be a valid existing path
			},

			autoload = false, -- whether to autoload sessions in the cwd at startup
			autosave = true, -- whether to autosave loaded sessions before quitting
		})

		local possession = require("nvim-possession")
		vim.keymap.set("n", "<leader>sl", function()
			possession.list()
		end, { desc = "possession.list" })
		vim.keymap.set("n", "<leader>sn", function()
			possession.new()
		end, { desc = "possession.new" })
		vim.keymap.set("n", "<leader>su", function()
			possession.update()
		end, { desc = "possession.update" })
		vim.keymap.set("n", "<leader>sd", function()
			possession.delete()
		end, { desc = "possession.delete" })
	end,
}
