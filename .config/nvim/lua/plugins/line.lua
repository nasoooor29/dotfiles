return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "yavorski/lualine-macro-recording.nvim" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				ignore_focus = {},
				always_divide_middle = true,
			},
			sections = {
				lualine_c = { "macro_recording", "%S" },
			},
		})
	end,
}
