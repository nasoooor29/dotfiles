return {
	"saghen/blink.cmp",
	lazy = false, -- lazy loading handled internally
	dependencies = {
		"rafamadriz/friendly-snippets",
		{ "L3MON4D3/LuaSnip", version = "v2.*" },

		"stevearc/vim-vscode-snippets",
	},
	version = "v0.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	config = function()
		local luasnip = require("luasnip")
		luasnip.config.setup({})
		require("luasnip.loaders.from_vscode").lazy_load()
		require("blink.cmp").setup({
			keymap = {
				preset = "enter",
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
			},

			snippets = {
				expand = function(snippet)
					luasnip.lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},
			sources = {
				default = { "lsp", "path", "luasnip", "buffer" },
			},
		})
	end,
}
