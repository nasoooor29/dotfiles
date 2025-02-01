return {
	"WhoIsSethDaniel/mason-tool-installer.nvim", -- Useful status updates for LSP.
	dependencies = { -- Automatically install LSPs and related tools to stdpath for Neovim
		{
			"williamboman/mason.nvim",
			config = true,
		},
	},
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = require("servers"),
		})
	end,
}
