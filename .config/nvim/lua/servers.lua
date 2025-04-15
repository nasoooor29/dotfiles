local servers = {
	cssls = {},
	css_variables = {},
	marksman = {},
	pyright = {},
	shfmt = {},
	gopls = {},
	goimports = {},
	ts_ls = {},
	sqlls = {},
	sqls = {},
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
	["rust-analyzer"] = {},
	emmet_ls = {
		filetypes = { "html", "css", "javascriptreact", "typescriptreact", "php", "phtml" },
	},
	intelephense = {
		filetypes = { "php", "phtml" },
	},
	phpactor = {
		filetypes = { "php", "phtml" },
	}
}

return servers;
