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
			preselect = "none",
			mapping = cmp.mapping.preset.insert({
				-- Select the [n]ext item
				["<C-n>"] = cmp.mapping.select_next_item(),
				-- Select the [p]revious item
				["<C-p>"] = cmp.mapping.select_prev_item(),

				-- Scroll the documentation window [b]ack / [f]orward
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-j>"] = cmp.mapping.select_next_item(),

				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-Space>"] = cmp.mapping.complete({}),

				-- TODO:change it to tab and s tab
				["<TAB>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
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
