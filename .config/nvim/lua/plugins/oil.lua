return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {

		view_options = {
			show_hidden = true,
		},

		keymaps = {
			["gd"] = {
				desc = "Toggle file detail view",
				callback = function()
					detail = not detail
					if detail then
						require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
					else
						require("oil").set_columns({ "icon" })
					end
				end,
			},
		},
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	enabled = false,
	config = function(_, opts)
		require("oil").setup(opts)
		vim.keymap.set("n", "<leader>fe", function()
			require("oil").toggle_float()
		end, { desc = "Open parent directory" })
	end,
}
