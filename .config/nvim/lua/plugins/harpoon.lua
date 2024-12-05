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
		end)

		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end)
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():next()
		end)
		-- bad idea
		-- vim.keymap.set("n", "<C-]>", function()
		-- 	harpoon:list():prev()
		-- end)
		-- vim.keymap.set("n", "<C-[>", function()
		-- 	harpoon:list():next()
		-- end)
		vim.keymap.set("n", "<leader>-", function()
			harpoon:list():remove()
		end)
		vim.keymap.set("n", "<leader>=", function()
			harpoon:list():add()
		end)
	end,
}
