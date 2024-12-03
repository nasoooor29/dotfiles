return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()
		require("mini.move").setup()
		require("mini.tabline").setup()
		-- require("mini.starter").setup()
		require("mini.pairs").setup()
		require("mini.cursorword").setup()
		require("mini.indentscope").setup({
			symbol = "▎",
			-- draw = {
			-- 	animation = indent.gen_animation.none(),
			-- },
			--
		})

		-- require('mini.statusline').setup { use_icons = vim.g.have_nerd_font }
	end,
}
