return {
	-- Main LSP Configuration
	"neovim/nvim-lspconfig",
	dependencies = { -- Automatically install LSPs and related tools to stdpath for Neovim
		{
			"williamboman/mason.nvim",
			config = true,
		}, -- NOTE: Must be loaded before dependants
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- Useful status updates for LSP.
		{
			"j-hui/fidget.nvim",
			opts = {},
		}, -- Allows extra capabilities provided by nvim-cmp
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				vim.keymap.set(
					"n",
					"<leader>q",
					vim.diagnostic.setloclist,
					{ desc = "Open diagnostic [Q]uickfix list" }
				)

				vim.keymap.set(
					"n",
					"gd",
					require("telescope.builtin").lsp_definitions,
					{ desc = "[G]oto [D]efinition" }
				)
				vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "[G]oto [R]eferences" })
				vim.keymap.set(
					"n",
					"gI",
					require("telescope.builtin").lsp_implementations,
					{ desc = "[G]oto [I]mplementation" }
				)
				vim.keymap.set(
					"n",
					"<leader>ds",
					require("telescope.builtin").lsp_document_symbols,
					{ desc = "[D]ocument [S]ymbols" }
				)
				vim.keymap.set(
					"n",
					"<leader>ws",
					require("telescope.builtin").lsp_dynamic_workspace_symbols,
					{ desc = "[W]orkspace [S]ymbols" }
				)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
				vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
			end,
		})

		local servers = {
			gopls = {},
			ts_ls = {},
			sqlls = {},

			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
		}

		require("mason").setup()

		-- You can add other tools here that you want Mason to install
		-- for you, so that they are available from within Neovim.
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format Lua code
		})
		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
		})
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local lspconfig = require("lspconfig")

		local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
		lspconfig["lua_ls"].setup({
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		})

		local masonLspCfg = require("mason-lspconfig")
		masonLspCfg.setup_handlers({
			function(server)
				lspconfig[server].setup({
					capablities = capabilities,
				})
			end,
		})
	end,
}
