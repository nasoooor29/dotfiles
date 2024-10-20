return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"go",
			"python",
			"markdown",
		},
		auto_install = true,
		sync_install = false,
		indent = { enable = true },
		highlight = {
			enable = true,
		},
	},
}
