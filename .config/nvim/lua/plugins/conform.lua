return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				go = { "goimports", "gofumpt" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})

		vim.keymap.set("n", "<leader>cf", function()
			conform.format()
		end, { desc = "Format current file" })
	end,
}
