return {
	"williamboman/mason.nvim",
	dependencies = {

		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({})
		local lspconfig = require("lspconfig")
		local masonLspCfg = require("mason-lspconfig")

		masonLspCfg.setup()
		masonLspCfg.setup_handlers({
			function(server)
				lspconfig[server].setup({})
			end,
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
				"html",
				"bashls",
				"cssls",
				-- "htmx",
			},
		})

		-- just so it can work right with the nvim config
		lspconfig["lua_ls"].setup({
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
