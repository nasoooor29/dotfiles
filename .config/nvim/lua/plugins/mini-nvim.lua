return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.move").setup()
		require("mini.fuzzy").setup()
		require("mini.visits").setup()
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.surround").setup()
		require("mini.splitjoin").setup()
		require("mini.trailspace").setup()
		require("mini.tabline").setup()
		require("mini.starter").setup()
		require("mini.comment").setup()
		-- require("mini.files").setup()
		require("mini.pairs").setup()
		require("mini.cursorword").setup()
		require("mini.animate").setup()
	end,
}
