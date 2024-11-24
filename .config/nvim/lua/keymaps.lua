-- TIP: Disable arrow keys in normal mode
-- movement keymaps
vim.keymap.set("n", "<esc><esc>", "<cmd>noh<CR>", { desc = "finish no search highlight", silent = true })
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-w>", "<Esc>wa", { silent = true })
vim.keymap.set("i", "<C-b>", "<Esc>ba", { silent = true })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set({ "n", "v" }, "<leader>ww", "<cmd>Neotree close<CR><cmd>wa<CR><cmd>qa<CR>", { desc = "exit neovim" })
vim.keymap.set({ "n", "v" }, "<leader>w", "<cmd>wa<CR>", { desc = "exit neovim" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "paste from system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>d", '"+d', { desc = "cut to system clipboard" })

-- these shortcuts is to make it look abit fimiliar to vscode
vim.keymap.set("n", "<Tab>", ">>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true, silent = true })
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>s", "<cmd>wa<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", "<cmd>wa<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qq", "<cmd>bd!<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qa", "<cmd>%bd|e#<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-S-j>", "yyp", { noremap = true, silent = true })
vim.keymap.set("n", "<A-S-k>", "yyP", { noremap = true, silent = true })
vim.keymap.set("v", "<S-A-j>", "Yp", { desc = "Duplicate selected lines down" })
vim.keymap.set("v", "<S-A-k>", "YP", { desc = "Duplicate selected lines up" })
vim.keymap.set("n", "<C-w>", "<cmd>w<CR><cmd>q<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>nn", ":enew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-Backspace>", "<esc>bciw", { noremap = true, silent = true })
vim.keymap.set("i", "<C-Enter>", "<esc>o", { noremap = true, silent = true })

-- Keymaps for resizing using Control + Shift + hjkl
vim.keymap.set("n", "<C-A-h>", ":vertical resize -5<CR>", { silent = true }) -- Shrink width (left)
vim.keymap.set("n", "<C-A-l>", ":vertical resize +5<CR>", { silent = true }) -- Increase width (right)
vim.keymap.set("n", "<C-A-j>", ":resize -5<CR>", { silent = true }) -- Shrink height (down)
vim.keymap.set("n", "<C-A-k>", ":resize +5<CR>", { silent = true }) -- Increase height (up)

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
