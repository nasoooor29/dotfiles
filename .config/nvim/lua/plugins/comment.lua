-- FIX: COMMENTING IS BROKEN ON REACT
return {
	"numToStr/Comment.nvim",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},
	opts = {
		-- add any options here
	},
}
