return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<leader>fo",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F][O]rmat buffer",
		},
	},
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- Use a sub-list to run only the first available formatter
				javascript = { { "prettierd", "prettier" } },
			},
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_fallback = true,
				timeout_ms = 500,
			},
		})
	end,
}
