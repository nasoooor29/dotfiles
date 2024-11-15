return {
	-- amongst your other plugins
	"akinsho/toggleterm.nvim",
	version = "*",

	config = function()
		require("toggleterm").setup({})

		Lazygit = require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
		LazySql = require("toggleterm.terminal").Terminal:new({ cmd = "lazysql", hidden = true, direction = "float" })
		LazyDoc =
			require("toggleterm.terminal").Terminal:new({ cmd = "lazydocker", hidden = true, direction = "float" })
		EmptyTerm = require("toggleterm.terminal").Terminal:new({ hidden = true })

		local cmd = "eval $RUN_CMD"
		CommandTerm = require("toggleterm.terminal").Terminal:new({ hidden = true, direction = "float" })

		vim.keymap.set({ "n", "t" }, "<leader>lg", "<cmd>lua Lazygit:toggle()<CR>", { noremap = true, silent = true })
		vim.keymap.set({ "n", "t" }, "<leader>ls", "<cmd>lua LazySql:toggle()<CR>", { noremap = true, silent = true })
		vim.keymap.set({ "n", "t" }, "<leader>ld", "<cmd>lua LazyDoc:toggle()<CR>", { noremap = true, silent = true })

		-- vim.keymap.set("n", "<C-`>", "<cmd>lua CommandTerm:toggle()<CR>", { desc = "" })
		-- vim.keymap.set("t", "<C-`>", "<cmd>lua CommandTerm:toggle()<CR>", { desc = "" })

		-- vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "" })
		-- vim.keymap.set("t", "<Esc><Esc>", "<cmd>ToggleTermToggleAll<CR>", { desc = "" })

		vim.keymap.set({ "i", "n" }, "<C-S-Enter>", function()
			vim.cmd("wa")
			CommandTerm:open()

			CommandTerm:send(cmd)
		end, { desc = "" })
		vim.keymap.set("t", "<C-S-Enter>", cmd .. "<CR>", { desc = "" })

		vim.keymap.set({ "t", "n" }, "<C-`>", "<cmd>lua CommandTerm:toggle()<CR>", { desc = "" })
	end,
}
