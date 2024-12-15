return { -- Autocompletion
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {},
		},
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"stevearc/vim-vscode-snippets",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.config.setup({})
		require("luasnip.loaders.from_vscode").lazy_load()
		local lspkind = require("lspkind")

		cmp.setup({
			window = {
				documentation = {
					cmp.config.window.bordered(),
					winblend = 0,
					border = "rounded",
					winhighlight = "Normal:None,FloatBorder:None",
					col_offset = -3,
					side_padding = 1,
				},
				completion = {
					cmp.config.window.bordered(),
					winblend = 0,
					border = "rounded",
					winhighlight = "Normal:None,FloatBorder:None",
					col_offset = -3,
					side_padding = 1,
				},
			},

			formatting = {
				expandable_indicator = true,
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
						path = "[PATH]",
						Copilot = "[Copilot]",
					},
					symbol_map = {
						Copilot = "",
					},
					-- before = require("tailwindcss-colorizer-cmp").formatter,
				}),
			},

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noinsert" },
			preselect = "None",
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<CR>"] = cmp.mapping.confirm({ select = true }),

				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-Space>"] = cmp.mapping.complete({}),

				["<TAB>"] = cmp.mapping(function(fallback)
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
						return
					end
					fallback() -- Allows cmp to handle the shift-tab if no snippet is active
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
						return
					end
					fallback() -- Allows cmp to handle the shift-tab if no snippet is active
				end, { "i", "s" }),

				["<BS>"] = cmp.mapping(function(fallback)
					-- Let backspace behave like normal in insert mode without affecting the snippet
					fallback() -- Pass the backspace key to cmp without additional logic
				end, { "i", "s" }),
			}),

			sources = {
				{ name = "luasnip" },
				{ name = "copilot" },
				{
					name = "lazydev",
					group_index = 0,
				},
				{ name = "nvim_lsp" },
				{ name = "path" },
			},
		})
	end,
}
