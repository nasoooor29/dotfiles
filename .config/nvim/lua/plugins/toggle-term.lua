return {
	-- amongst your other plugins
	"akinsho/toggleterm.nvim",
	version = "*",

	config = function()
		require("toggleterm").setup({})

		Lazygit = require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
		LazySql = require("toggleterm.terminal").Terminal:new({ cmd = "lazysql", hidden = true, direction = "float" })
		LazyDocker =
			require("toggleterm.terminal").Terminal:new({ cmd = "lazydocker", hidden = true, direction = "float" })
		EmptyTerm = require("toggleterm.terminal").Terminal:new({ hidden = true })

		CommandTerm = require("toggleterm.terminal").Terminal:new({
			hidden = true,
			direction = "float",
			on_open = function(term)
				term.send(term, "eval $RUN_CMD")
			end,
		})

		vim.keymap.set("n", "<leader>lg", "<cmd>lua Lazygit:toggle()<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>ls", "<cmd>lua LazySql:toggle()<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>ld", "<cmd>lua LazyDocker:toggle()<CR>", { noremap = true, silent = true })
		vim.keymap.set("t", "<leader>lg", "<cmd>lua Lazygit:toggle()<CR>", { noremap = true, silent = true })
		vim.keymap.set("t", "<leader>ls", "<cmd>lua LazySql:toggle()<CR>", { noremap = true, silent = true })
		vim.keymap.set("t", "<leader>ld", "<cmd>lua LazyDocker:toggle()<CR>", { noremap = true, silent = true })

		vim.keymap.set("n", "<C-`>", "<cmd>lua EmptyTerm:toggle()<CR>", { desc = "" })
		vim.keymap.set("t", "<C-`>", "<cmd>lua EmptyTerm:toggle()<CR>", { desc = "" })

		vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "" })

		vim.keymap.set("n", "<C-S-Enter>", "<cmd>lua CommandTerm:toggle()<CR>", { desc = "" })
		vim.keymap.set("t", "<C-S-Enter>", "<cmd>lua CommandTerm:toggle()<CR>", { desc = "" })
	end,
}
