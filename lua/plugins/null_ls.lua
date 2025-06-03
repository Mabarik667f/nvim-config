local none_ls = require("null-ls")

none_ls.setup({
	debounce = 500,
	sources = {
		none_ls.builtins.diagnostics.golangci_lint, -- golang
		none_ls.builtins.diagnostics.selene, -- lua linter
		none_ls.builtins.formatting.stylua,
		none_ls.builtins.code_actions.gitsigns, -- git pointer
	},
})
