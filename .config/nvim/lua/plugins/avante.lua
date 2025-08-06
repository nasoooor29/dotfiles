---@diagnostic disable: missing-fields
vim.keymap.set({ "v", "n" }, "<leader>cc", function()
	require("codecompanion").toggle()
end, { silent = true, desc = "Code Companion: Toggle" })
vim.keymap.set({ "v", "n" }, "<leader>al", function()
	require("codecompanion").last_chat()
end, { silent = true, desc = "Code Companion: Last Chat" })
vim.keymap.set({ "v", "n" }, "<leader>aa", function()
	require("codecompanion").add({})
end, { silent = true, desc = "Code Companion: Add" })
vim.keymap.set({ "v", "n" }, "<leader>ae", ":CodeCompanion<CR>", { silent = true, desc = "Code Companion: Inline" })

return {
	"nvim-tree/nvim-web-devicons",
	"stevearc/dressing.nvim",
	"nvim-lua/plenary.nvim",
	"MunifTanjim/nui.nvim",
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			{
				"echasnovski/mini.diff",
				config = function()
					local diff = require("mini.diff")
					diff.setup({
						-- Disabled by default
						source = diff.gen_source.none(),
					})
				end,
			},
			"ravitemer/mcphub.nvim",
			"zbirenbaum/copilot.lua",
		},
		opts = {
			system_prompt = function(opts)
				return "You are an AI assistant working in Neovim. Do not ask the user if he want to apply the suggested changes, instead just apply or use the tool you need."
			end,

			---@type CodeCompanion.Strategies
			strategies = {
				context = {},
				selected = {},
				---@type CodeCompanion.Chat
				chat = {
					adapter = {
						name = "copilot",
						model = "claude-sonnet-4",
					},
					tools = {
						groups = {
							["agent_grp"] = {
								description = "A custom agent combining tools",
								system_prompt = "Describe what the agent should do",
								tools = {
									"cmd_runner",
									"mcp",
									"insert_edit_into_file",
									"grep_search",
									"file_search",
									"create_file",
									"read_file",
								},
								opts = {

									default_tools = {
										"agent_grp", -- Use the agent group as the default tool
									},
									collapse_tools = true, -- When true, show as a single group reference instead of individual tools
									auto_submit_errors = true, -- Send any errors to the LLM automatically?
									auto_submit_success = true, -- Send any successful output to the LLM automatically?
								},
							},
						},
					},
				},
			},
			---@type CodeCompanion.Extensions
			extensions = {
				mcphub = {
					callback = "mcphub.extensions.codecompanion",
					opts = {
						show_result_in_chat = true, -- Show mcp tool results in chat
						make_vars = true, -- Convert resources to #variables
						make_slash_commands = true, -- Add prompts as /slash commands
					},
				},
			},
		},
		-- function()
		-- 	require("codecompanion").setup({
		-- 		extensions = {
		-- 			mcphub = {
		-- 				callback = "mcphub.extensions.codecompanion",
		-- 				opts = {
		-- 					show_result_in_chat = true, -- Show mcp tool results in chat
		-- 					make_vars = true, -- Convert resources to #variables
		-- 					make_slash_commands = true, -- Add prompts as /slash commands
		-- 				},
		-- 			},
		-- 		},
		-- 	})
		-- 	-- vim.keymap.set({ "v", "n" }, "<leader>cc", function()
		-- 	-- 	require("codecompanion").toggle()
		-- 	-- end, { silent = true, desc = "Code Companion: Toggle" })
		-- 	-- vim.keymap.set({ "v", "n" }, "<leader>al", function()
		-- 	-- 	require("codecompanion").last_chat()
		-- 	-- end, { silent = true, desc = "Code Companion: Last Chat" })
		-- 	-- vim.keymap.set({ "v", "n" }, "<leader>aa", function()
		-- 	-- 	require("codecompanion").add({})
		-- 	-- end, { silent = true, desc = "Code Companion: Add" })
		-- 	-- vim.keymap.set(
		-- 	-- 	{ "v", "n" },
		-- 	-- 	"<leader>ae",
		-- 	-- 	":CodeCompanion<CR>",
		-- 	-- 	{ silent = true, desc = "Code Companion: Inline" }
		-- 	-- )
		-- end,
	},
	{
		"ravitemer/mcphub.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
		config = function()
			require("mcphub").setup()
		end,
	},
	{
		-- NOTE: for configuration options refer to this link:
		-- https://github.com/MeanderingProgrammer/render-markdown.nvim/wiki
		"MeanderingProgrammer/render-markdown.nvim",
		opts = { file_types = { "markdown", "Avante", "codecompanion" } },
		ft = { "markdown", "Avante", "codecompanion" },
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

	-- {
	-- 	"yetone/avante.nvim",
	-- 	event = "VeryLazy",
	-- 	lazy = false,
	-- 	veersion = false,
	-- 	build = "make",
	-- 	opts = {
	-- 		system_prompt = function()
	-- 			local hub = require("mcphub").get_hub_instance()
	-- 			local pp = hub and hub:get_active_servers_prompt() or ""
	-- 			return pp
	-- 		end,
	-- 		-- Using function prevents requiring mcphub before it's loaded
	-- 		custom_tools = function()
	-- 			return {
	-- 				require("mcphub.extensions.avante").mcp_tool(),
	-- 			}
	-- 		end,
	-- 		edit = {
	-- 			border = "rounded",
	-- 			start_insert = true, -- Start insert mode when opening the edit window
	-- 		},
	--
	-- 		provider = "copilot",
	-- 		hints = {
	-- 			enabled = true,
	-- 		},
	-- 		windows = {
	-- 			width = 40,
	-- 			sidebar_header = {
	-- 				enabled = false, -- true, false to enable/disable the header
	-- 			},
	-- 			input = {
	-- 				prefix = "> ",
	-- 				height = 4, -- Height of the input window in vertical layout
	-- 			},
	-- 			-- ask = {
	-- 			-- 	floating = true, -- Open the 'AvanteAsk' prompt in a floating window
	-- 			-- },
	-- 		},
	-- 	},
	-- 	enabled = false,
	--
	-- 	keys = {
	-- 		{ "<leader>ava", ":AvanteClear<CR>:AvanteToggle<CR>", silent = true, desc = "avante: clear and toggle" },
	-- 	},
	-- },
}
