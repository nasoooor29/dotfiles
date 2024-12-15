return {
	-- Main LSP Configuration
	"neovim/nvim-lspconfig",
	dependencies = { -- Automatically install LSPs and related tools to stdpath for Neovim
		{
			"williamboman/mason.nvim",
			config = true,
		}, -- NOTE: Must be loaded before dependants
		"williamboman/mason-lspconfig.nvim",
		{
			"j-hui/fidget.nvim",
			opts = {},
		}, -- Allows extra capabilities provided by nvim-cmp
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		require("mason").setup()

		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local masonLspCfg = require("mason-lspconfig")
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
		local on_attach = function(client, bufnr)
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			local t = require("telescope.builtin")

			vim.keymap.set("n", "gd", t.lsp_definitions, bufopts)
			vim.keymap.set("n", "gi", t.lsp_implementations, bufopts)
			vim.keymap.set("n", "gr", t.lsp_references, bufopts) -- added for references
			vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
		end
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })

		local servers = require("servers")
		masonLspCfg.setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					require("lspconfig")[server_name].setup({
						on_attach = on_attach,
						capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {}),
					})
				end,
			},
		})
	end,
}
