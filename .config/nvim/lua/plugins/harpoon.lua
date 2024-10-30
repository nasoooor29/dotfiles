return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})
		vim.keymap.set("n", "<A-m>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<A-1>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<A-2>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<A-3>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<A-4>", function()
			harpoon:list():select(4)
		end)
		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():next()
		end)
		vim.keymap.set("n", "<A-->", function()
			harpoon:list():remove()
		end)

		vim.keymap.set("n", "<A-0>", function()
			harpoon:list():add()
		end)
	end,
}
