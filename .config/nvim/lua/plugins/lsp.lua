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
		require("mason").setup()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local lspconfig = require("lspconfig")
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

		vim.diagnostic.config({
			float = {
				scope = "cursor",
				border = "rounded",
				max_width = 80, -- Set the maximum width for the floating window
			},
		})

		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })
		local servers = {
			cssls = {},
			css_variables = {},
			marksman = {},
			pyright = {},
			shfmt = {},
			stylua = {},
			gopls = {},
			goimports = {},
			ts_ls = {},
			sqlls = {},
			bashls = {},
			ansiblels = {},
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

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format Lua code
			"ansible-lint", -- Used to format Lua code
		})

		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
		})

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
	end,
}
