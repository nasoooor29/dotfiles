return {
	"ThePrimeagen/harpoon",
	-- enabled = false,
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()
		vim.keymap.set("n", "<leader>m", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "harpoon: show menu" })
		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "harpoon: select 1" })
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "harpoon: select 2" })
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "harpoon: select 3" })
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "harpoon: select 4" })
		vim.keymap.set("n", "[h", function()
			harpoon:list():prev()
		end, { desc = "harpoon: go to prev" })
		vim.keymap.set("n", "]h", function()
			harpoon:list():next()
		end, { desc = "harpoon: go to next" })
		vim.keymap.set("n", "<leader>-", function()
			harpoon:list():remove()
		end, { desc = "harpoon: remove from list" })
		vim.keymap.set("n", "<leader>=", function()
			harpoon:list():add()
		end, { desc = "harpoon: add to list" })
	end,
}
