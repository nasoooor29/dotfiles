return {
	"williamboman/mason.nvim",
	dependencies = {

		"neovim/nvim-lspconfig",

		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({})
		local lspconfig = require("lspconfig")
		local masonLspCfg = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		-- dont be an idiot and renam it to capablities don't be stupid
		local cap = cmp_nvim_lsp.default_capabilities()
		masonLspCfg.setup()
		masonLspCfg.setup_handlers({
			function(server)
				lspconfig[server].setup({
					capablities = cap,
				})
			end,
		})

		lspconfig["gopls"].setup({
			capabilities = cap,
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
						unreachable = true,
					},
					staticcheck = true,
				},
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"bash-language-server",
				"lua-language-server",
				"vim-language-server",
				"gopls",
				"stylua",
				"gofumpt",
				"shfmt",
				"gopls",
				"lua_ls",
				"stylua",
				"ts_ls",
				"html",
				"bashls",
				"cssls",
				"goimports",
			},
		})

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
		-- keybinds

		vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "[G]oto [D]efinition" })

		vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "[G]oto [R]eferences" })

		vim.keymap.set(
			"n",
			"gI",
			require("telescope.builtin").lsp_implementations,
			{ desc = "[G]oto [I]mplementation" }
		)

		vim.keymap.set(
			"n",
			"<leader>D",
			require("telescope.builtin").lsp_type_definitions,
			{ desc = "Type [D]efinition" }
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

		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" }, { "n", "x" })

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
	end,
}
