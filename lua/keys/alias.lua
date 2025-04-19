local main = require("keys/main")

-- off highlighting
main.nm("<Esc>", ":noh<CR>")

-- movement
main.nm("<S-Tab>", "<<")
main.vm("<S-Tab>", "<gv")
main.nm("<Tab>", ">>")
main.vm("<Tab>", ">gv")

-- autocomplete select option
main.nm("<A-k>", ":m .-2<CR>==")
main.vm("<A-k>", ":m '<-2<CR>gv=gv")
main.nm("<A-j>", ":m .+1<CR>==")
main.vm("<A-j>", ":m '>+1<CR>gv=gv")

-- rename all vars in file
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)

-- Formatter --

--- hotkeys ---

-- block formatter
local range_formatting = function()
	local start_row, _ = unpack(vim.api.nvim_buf_get_mark(0, "<"))
	local end_row, _ = unpack(vim.api.nvim_buf_get_mark(0, ">"))
	vim.lsp.buf.format({
		range = {
			["start"] = { start_row, 0 },
			["end"] = { end_row, 0 },
		},
		async = true,
	})
end

vim.keymap.set("v", "<leader>f", range_formatting, { desc = "Range Formatting" })

-- toggle formatter
vim.keymap.set("n", "<leader>F", function()
	if vim.b.disable_autoformat or vim.g.disable_autoformat then
		vim.cmd("FormatEnable")
	else
		vim.cmd("FormatDisable")
	end
end, { desc = "Toggle [F]ormat" })
