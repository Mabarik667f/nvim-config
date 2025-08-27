local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if ok then
	treesitter.setup({
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
			"html",
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
		},
	})
else
	vim.notify("treesitter failed to load:" .. treesitter, vim.log.levels.ERROR)
end
