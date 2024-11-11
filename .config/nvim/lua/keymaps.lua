-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>p", '"+p', { desc = "paste from system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>d", '"+d', { desc = "cut to system clipboard" })

-- these shortcuts is to make it look abit fimiliar to vscode
--
vim.api.nvim_set_keymap("n", "<Tab>", ">>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<<", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap("n", "<C-]>", ">>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<C-]>", ">gv", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-[>", "<<", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<C-[>", "<gv", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-S-j>", "yyp", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-S-k>", "yyP", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-w>", "<cmd>bd<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-n>", ":enew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })

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
