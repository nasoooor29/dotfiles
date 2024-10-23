return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{
			"kristijanhusak/vim-dadbod-completion",
			ft = { "sql", "mysql", "plsql" },
			lazy = true,
		},
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	config = function()
		-- require("vim-dadbod").setup()
		require("cmp").setup.buffer({
			vim.cmd(
				[[autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })]]
			),
			sources = { {
				name = "vim-dadbod-completion",
			} },
		})
		vim.g.db_ui_use_nerd_fonts = 1
	end,
}
