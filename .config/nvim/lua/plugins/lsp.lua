return {
	-- Main LSP Configuration
	"neovim/nvim-lspconfig",
	dependencies = { -- Automatically install LSPs and related tools to stdpath for Neovim
		{
			"williamboman/mason.nvim",
			config = true,
		}, -- NOTE: Must be loaded before dependants
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",

	},
	config = function()
		require("mason").setup()

		---@diagnostic disable-next-line: unused-local
		local on_attach = function(client, bufnr)
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			local t = require("telescope.builtin")
			vim.keymap.set("n", "gr", t.lsp_references, bufopts) -- added for references
			vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, bufopts)
		end

		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })

		local servers = require("servers")
		local server_names = vim.tbl_keys(servers)
		---@diagnostic disable-next-line: missing-fields
		require("mason-lspconfig").setup({
			-- automatic_installation = true,
			-- ensure_installed = server_names,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					require("lspconfig")[server_name].setup({
						on_attach = on_attach,
						capabilities = vim.tbl_deep_extend(
							"force",
							vim.lsp.protocol.make_client_capabilities(),
							require("blink.cmp").get_lsp_capabilities(),
							server or {}
						),
					})
				end,
			},
		})
	end,
}
