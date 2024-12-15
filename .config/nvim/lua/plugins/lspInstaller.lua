return {
	"WhoIsSethDaniel/mason-tool-installer.nvim", -- Useful status updates for LSP.
	dependencies = { -- Automatically install LSPs and related tools to stdpath for Neovim
		{
			"williamboman/mason.nvim",
			config = true,
		},
	},
	config = function()
		local lspCfg = require("mason-lspconfig")
		require("mason-tool-installer").setup({
			ensure_installed = lspCfg.ensure_installed,
		})
	end,
}
