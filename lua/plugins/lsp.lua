local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.textDocument.semanticTokens = {
	multilineTokenSupport = true,
}

vim.lsp.config("*", {
	capabilities = capabilities,
	root_markers = { ".git" },
})

local defaultServers = {
	"ruff",
	"rust_analyzer",
	"dockerls",
	"docker_compose_language_service",
	"vls",
	"clangd",
	"tailwindcss",
	"jsonls",
	"sqruff",
	"roslyn_ls",
	"csharp_ls",
	"eslint",
	"css_variables",
	"cssmodules_ls",
	"cssls",
}

local serversWithConfig = {
	"gopls",
	"golangci_lint_ls",
	"nil_ls",
	"lua_ls",
	"pyright",
}

vim.lsp.enable(defaultServers)
vim.lsp.enable(serversWithConfig)
