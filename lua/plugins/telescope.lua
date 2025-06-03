local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

vim.keymap.set("n", "<leader>fd", function()
	require("telescope").extensions.git_file_history.git_file_history()
end, { desc = "Git file history" })

require("telescope").setup({
	defaults = {
		theme = "ivy",
	},
	pickers = {
		find_files = {
			theme = "ivy",
		},
		live_grep = {
			theme = "ivy",
		},
		buffers = {
			theme = "ivy",
		},
		help_tags = {
			theme = "ivy",
		},
	},
	extensions = {
		git_file_history = {
			browser_command = nil,
		},
	},
})
require("telescope").load_extension("git_file_history")
