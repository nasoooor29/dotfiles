return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.move").setup()
		require("mini.visits").setup()
		require("mini.surround").setup()
		require("mini.tabline").setup()
		require("mini.starter").setup()
		require("mini.pairs").setup()
		require("mini.cursorword").setup()
	end,
}
