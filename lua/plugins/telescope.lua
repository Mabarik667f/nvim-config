local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


require('telescope').setup {
	defaults = {
		theme = "ivy",
	},
	pickers = {
		find_files = {
			theme = "ivy"
		},
		live_grep = {
			theme = "ivy"
		},
		buffers = {
			theme = "ivy"
		},
		help_tags = {
			theme = "ivy"
		},
	}
}
