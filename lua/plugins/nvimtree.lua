local nvimtree = require("nvim-tree")
nvimtree.setup({
	git = {
		enable = true,
	},
})
vim.api.nvim_set_keymap("n", "<C-Space>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-f>", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
