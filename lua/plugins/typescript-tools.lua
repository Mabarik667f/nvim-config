local api = require("typescript-tools.api")
local lspstatus = require("lsp-status")
local capabilities = vim.tbl_extend("keep", lspstatus.capabilities, require("cmp_nvim_lsp").default_capabilities())

require("typescript-tools").setup({
	capabilities = capabilities,
	handlers = {
		["textDocument/publishDiagnostics"] = api.filter_diagnostics({ 80001 }),
	},
})
