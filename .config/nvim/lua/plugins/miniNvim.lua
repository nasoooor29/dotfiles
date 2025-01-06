local StatusLineOpts = {
	use_icons = vim.g.have_nerd_font,
	content = {
		active = function()
			local check_macro_recording = function()
				if vim.fn.reg_recording() ~= "" then
					return "Reg @" .. vim.fn.reg_recording()
				else
					return ""
				end
			end

			local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
			local git = MiniStatusline.section_git({ trunc_width = 40 })
			local diff = MiniStatusline.section_diff({ trunc_width = 75 })
			local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
			-- local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
			local filename = MiniStatusline.section_filename({ trunc_width = 140 })
			local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
			local location = MiniStatusline.section_location({ trunc_width = 200 })
			local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
			local macro = check_macro_recording()

			return MiniStatusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics } },
				"%<", -- Mark general truncate point
				{ hl = "MiniStatuslineFilename", strings = { "" } },
				"%=", -- End left alignment
				{ hl = "MiniStatuslineFilename", strings = { macro } },
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				{ hl = mode_hl, strings = { search, location } },
			})
		end,
	},
}

return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.statusline").setup(StatusLineOpts)
		require("mini.ai").setup()
		require("mini.surround").setup()
		require("mini.move").setup()
		-- require("mini.tabline").setup()
		require("mini.starter").setup()
		require("mini.pairs").setup()
		require("mini.cursorword").setup()
		require("mini.indentscope").setup()
		require("mini.hipatterns").setup({
			highlighters = {
				hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
			},
		})
	end,
}
