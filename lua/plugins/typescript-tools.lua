local api = require("typescript-tools.api")
require("typescript-tools").setup {
	handlers = {
		["textDocument/publishDiagnostics"] = api.filter_diagnostics(
			{ 80001 }
		),
	},
}
