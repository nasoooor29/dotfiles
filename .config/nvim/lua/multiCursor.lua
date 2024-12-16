local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>ra", function()
	-- Get the word under the cursor
	local word = vim.fn.expand("<cword>")
	-- Prompt the user for the replacement word
	local replacement = vim.fn.input('Replace "' .. word .. '" with: ')
	-- Ensure a valid replacement is entered
	if replacement ~= "" then
		-- Perform interactive substitution with confirmation (`gc`)
		vim.cmd(":%s/\\<" .. word .. "\\>/" .. replacement .. "/gc")
	else
		print("No replacement provided. Aborting.")
	end
end, opts)

function SendKeys(command, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(command, true, true, true), mode, false)
end
vim.keymap.set("n", "<leader>ri", function()
	local command = ":%s/\\<" .. vim.fn.expand("<cword>") .. "\\>//g"
	SendKeys(command, "n")
	SendKeys("<Left><Left>", "n")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>rii", function()
	local command = ":%s/\\<" .. vim.fn.expand("<cword>") .. "\\>//gc"
	vim.cmd(command)
end, { noremap = true, silent = true })

local macro_register = "z" -- The register to store the macro

-- Record and execute a macro on the current word, stopping after the first occurrence
vim.keymap.set("n", "<leader>rc", function()
	local word = vim.fn.expand("<cword>") -- Get the word under the cursor
	if word == "" then
		vim.notify("No word under the cursor", vim.log.levels.WARN)
		return
	end

	-- Start recording a macro in the specified register
	vim.cmd("normal! q" .. macro_register)

	vim.notify("Recording started. Perform your action and go to the next occurrence.")
end, { noremap = true, silent = true })

-- Apply the recorded macro to the next occurrence
vim.keymap.set("n", "<leader>rn", function()
	-- Find the next occurrence of the word
	local found = vim.fn.search("\\<" .. vim.fn.expand("<cword>") .. "\\>", "W")
	if found == 0 then
		vim.notify("No more occurrences found", vim.log.levels.INFO)
		return
	end

	-- Execute the macro on the current match
	vim.cmd("normal! @" .. macro_register)
end, { noremap = true, silent = true })
