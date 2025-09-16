local ok, none_ls = pcall(require, "null-ls")
if not ok then
	vim.notify("null-ls failed to load: " .. none_ls, vim.log.levels.ERROR)
	return
end

none_ls.setup({
	debounce = 500,
	sources = {
		none_ls.builtins.diagnostics.golangci_lint.with({
			condition = function()
				return vim.fn.executable("golangci-lint") == 1
			end,
		}),
		none_ls.builtins.diagnostics.selene.with({
			condition = function()
				return vim.fn.executable("selene") == 1
			end,
		}),
		none_ls.builtins.formatting.stylua.with({
			condition = function()
				return vim.fn.executable("stylua") == 1
			end,
		}),
		none_ls.builtins.formatting.prettier.with({
			condition = function()
				return vim.fn.executable("prettier") == 1
			end,
		}),
		none_ls.builtins.code_actions.gitsigns,
	},
})
