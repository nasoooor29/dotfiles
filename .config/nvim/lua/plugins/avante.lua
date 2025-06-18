return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	veersion = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{
			-- NOTE: for configuration options refer to this link:
			-- https://github.com/MeanderingProgrammer/render-markdown.nvim/wiki
			"MeanderingProgrammer/render-markdown.nvim",
			opts = { file_types = { "markdown", "Avante" } },
			ft = { "markdown", "Avante" },
		},

		{ "giuxtaposition/blink-cmp-copilot" },
		{
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			build = ":Copilot auth",
			event = "InsertEnter",
			config = function()
				vim.keymap.set("n", "<c-s>", function()
					require("copilot.suggestion").toggle_auto_trigger()
				end, { noremap = true, silent = true, desc = "Toggle Copilot suggestion auto-trigger" })

				require("copilot").setup({
					suggestion = {
						auto_trigger = true,
						debounce = 100,
						keymap = {
							accept = "<Tab>",
							accept_word = false, -- Use <Tab> to accept the whole suggestion
							accept_line = false, -- Use <Tab> to accept the whole line
							next = "<c-j>",
							prev = "<c-k>",
							dismiss = "<c-e>",
						},
					},
					panel = {
						enabled = false, -- Disable the Copilot panel
					},
					filetypes = {
						enabled = {
							["*"] = true, -- Enable Copilot for all file types
						},
						disabled = {
							-- ["markdown"] = true, -- Disable Copilot for markdown files
						},
					},
				})
			end,
		},
		-- {
		-- 	"zbirenbaum/copilot-cmp",
		-- 	dependencies = {
		-- 		"zbirenbaum/copilot.lua",
		-- 	},
		-- 	config = function()
		-- 		vim.keymap.set("n", "<c-s>", function()
		-- 			require("copilot.suggestion").toggle_auto_trigger()
		-- 		end, { noremap = true, silent = true })
		-- 		require("copilot").setup({
		-- 			suggestion = {
		-- 				enabled = true,
		-- 				keymap = {
		-- 					accept = "<Tab>",
		-- 					next = "<c-j>",
		-- 					prev = "<c-k>",
		-- 					dismiss = "<c-d>",
		-- 				},
		-- 			},
		-- 			-- panel = { enabled = false },
		-- 		})
		-- 		-- require("copilot_cmp").setup()
		-- 	end,
		-- },
	},
	build = "make",
	opts = {
		edit = {
			border = "rounded",
			start_insert = true, -- Start insert mode when opening the edit window
		},

		provider = "copilot",
		hints = {
			enabled = true,
		},
		windows = {
			width = 40,
			sidebar_header = {
				enabled = false, -- true, false to enable/disable the header
			},
			input = {
				prefix = "> ",
				height = 4, -- Height of the input window in vertical layout
			},
			-- ask = {
			-- 	floating = true, -- Open the 'AvanteAsk' prompt in a floating window
			-- },
		},
	},

	keys = {
		{ "<leader>ava", ":AvanteClear<CR>:AvanteToggle<CR>", silent = true, desc = "avante: clear and toggle" },
	},
}
