-- TIP: Disable arrow keys in normal mode
-- movement keymaps

local opts = { noremap = false, silent = true }
local set = vim.keymap.set
set("n", "<esc><esc>", "<cmd>noh<CR>", { desc = "finish no search highlight", silent = true })
set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
set("i", "<C-h>", "<Left>")
set("i", "<C-j>", "<Down>")
set("i", "<C-k>", "<Up>")
set("i", "<C-l>", "<Right>")
set("i", "<C-b>", "<Esc>ba", opts)

set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

set({ "n", "v" }, "<leader>ww", "<cmd>Neotree close<CR><cmd>wa<CR><cmd>qa<CR>", { desc = "exit neovim" })
set({ "n", "v" }, "<leader>w", "<cmd>wa<CR>", { desc = "exit neovim" })
set("n", "<leader>p", '"+p', { desc = "paste from system clipboard" })
set({ "n", "x" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
set({ "n", "x" }, "<leader>d", '"+d', { desc = "cut to system clipboard" })

-- these shortcuts is to make it look abit fimiliar to vscode
set("n", "<Tab>", ">>", opts)
set("n", "<S-Tab>", "<<", opts)
set("v", "<Tab>", ">gv", opts)
set("v", "<S-Tab>", "<gv", opts)
set("n", "<C-[>", "<cmd>bnext<CR>", opts)
set("n", "<C-]>", "<cmd>bprevious<CR>", opts)
set("n", "<leader>s", "<cmd>wa<CR>", opts)
set("n", "<leader>w", "<cmd>wa<CR>", opts)
set("n", "<leader>q", "<cmd>bd<CR>", opts)
set("n", "<leader>qq", "<cmd>bd!<CR>", opts)
set("n", "<leader>qa", "<cmd>%bd|e#<CR>", opts)
set("n", "<A-S-j>", "yyp", opts)
set("n", "<A-S-k>", "yyP", opts)
set("v", "<S-A-j>", "Yp", { desc = "Duplicate selected lines down" })
set("v", "<S-A-k>", "YP", { desc = "Duplicate selected lines up" })
set("n", "<C-w>", "<cmd>w<CR><cmd>q<CR>", opts)
set("n", "<leader>nn", ":enew<CR>", opts)
set("n", "<C-f>", "<cmd>Telescope live_grep<CR>", opts)
set("i", "<C-Backspace>", "<esc>bciw", opts)
set("i", "<C-Enter>", "<esc>o", opts)

-- Keymaps for resizing using Control + Shift + hjkl
set("n", "<C-A-h>", ":vertical resize -5<CR>", opts) -- Shrink width (left)
set("n", "<C-A-l>", ":vertical resize +5<CR>", opts) -- Increase width (right)
set("n", "<C-A-j>", ":resize -5<CR>", opts) -- Shrink height (down)
set("n", "<C-A-k>", ":resize +5<CR>", opts) -- Increase height (up)

set("n", "<leader>rrr", ":luafile %<CR>", opts) -- Increase height (up)

function get_distro_name()
	local handle = io.popen("echo $WSL_DISTRO_NAME")
	local hostname = handle:read("*a")
	handle:close()
	return hostname:match("^%s*(.-)%s*$")
end

if get_distro_name() ~= "" then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end
