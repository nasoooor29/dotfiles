return {
	cssls = {},
	css_variables = {},
	marksman = {},
	pyright = {},
	shfmt = {},
	gopls = {},
	goimports = {},
	ts_ls = {},
	sqlls = {},
	bashls = {},
	ansiblels = {},
	lua_ls = {
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
	},
	stylua = {},
	templ = {},
	["ansible-lint"] = {},
	emmet_ls = {
		filetypes = { "html", "css", "javascriptreact", "typescriptreact", "php" },
	}

}
