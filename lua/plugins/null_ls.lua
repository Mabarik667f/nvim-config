local none_ls = require("null-ls")

none_ls.setup({
	sources = {
		none_ls.builtins.diagnostics.pylint,  -- python
		none_ls.builtins.diagnostics.golangci_lint, -- golang
		none_ls.builtins.diagnostics.selene,  -- lua linter
		none_ls.builtins.diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "postgres" }
		}),

		none_ls.builtins.code_actions.gitsigns, -- git pointer
	}
})
