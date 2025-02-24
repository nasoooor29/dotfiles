return {
	"Saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = {
		"rafamadriz/friendly-snippets",
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
		{
			"stevearc/vim-vscode-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_vscode").lazy_load({ paths = "./my_snippets" })
			end,
		},
	},

	-- use a release tag to download pre-built binaries
	-- version = false,
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "enter",
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },

			["<A-k>"] = { "select_prev", "fallback" },
			["<A-j>"] = { "select_next", "fallback" },
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		fuzzy = {
			sorts = {
				"exact",
				"score",
				"sort_text",
			}
		},
		sources = {
			default = { "lsp", "path", "snippets" },
			providers = {
				snippets = {
					max_items = 10,
					-- score_offset = 10,
				},
			},
		},
		snippets = { preset = "luasnip" },
		completion = {
			list = {
				selection = {
					preselect = function(ctx)
						return ctx.mode ~= "cmdline"
					end,
					auto_insert = false,
				},
			},
			menu = {
				draw = {
					columns = {
						{ "label",      "label_description", gap = 1 },
						{ "kind_icon" },
						{ "source_name" },
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 1,
			},
		},
	},
	opts_extend = { "sources.default" },
}
