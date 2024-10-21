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
		local capablities = cmp_nvim_lsp.default_capabilities()
		masonLspCfg.setup()
		masonLspCfg.setup_handlers({
			function(server)
				lspconfig[server].setup({
					capablities = capablities,
				})
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
				"ts_ls",
				"html",
				"bashls",
				"cssls",
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
