require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"lua",
		"go",
		"typescript",
		"javascript",
		"bash",
		"dockerfile",
		"markdown",
		"python",
		"rust",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true
	}
})
