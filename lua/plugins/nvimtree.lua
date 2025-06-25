local nvimtree = require("nvim-tree")
nvimtree.setup({
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
})
vim.api.nvim_set_keymap("n", "<C-Space>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-f>", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
