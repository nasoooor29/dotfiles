return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets", -- https://github.com/rafamadriz/friendly-snippets

		"onsails/lspkind.nvim",
		"stevearc/vim-vscode-snippets",
	},
	config = function()
		local cmp = require("cmp")

		local lspkind = require("lspkind")
		vim.opt.completeopt = { "menu", "menuone", "noselect" }

		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "luasnip" }, -- For luasnip users.
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				-- { name = "orgmode" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				-- fields = { "kind", "abbr", "menu" },
				format = lspkind.cmp_format({
					mode = "symbol_text", -- show only symbol annotations
					maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
					menu = {
						nvim_lsp = "[LSP]",
						luasnip = "[LUASNIP]",
						nvim_lua = "[NVIM_LUA]",
						buffer = "[BUFFER]",
						gitmoji = "[GITMOJI]",
						path = "[PATH]",
						Codeium = "[Codeium]",
						Copilot = "[Copilot]",
					},
					symbol_map = {
						Copilot = "",
						Codeium = "",
					},
					-- before = require("tailwindcss-colorizer-cmp").formatter,
				}),
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}
