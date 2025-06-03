local lspconfig = require("lspconfig")
local lspstatus = require("lsp-status")

local servers = {
	"pyright",
	"ruff",
	"rust_analyzer",
	"gopls",
	"dockerls",
	"docker_compose_language_service",
	"vls",
	"clangd",
	"tailwindcss",
}

local capabilities = vim.tbl_extend("keep", lspstatus.capabilities, require("cmp_nvim_lsp").default_capabilities())

lspconfig.pyright.setup({
	settings = {
		pyright = {
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				ignore = { "*" },
			},
		},
	},
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				library = {
					vim.fn.stdpath("config"),
					vim.api.nvim_get_runtime_file("", true),
				},
				checkThirdParty = false,
			},
			telemetry = { enable = false },
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end

lspstatus.config({
	status_symbol = "LSP",
	indicator_errors = "E",
	indicator_warnings = "W",
	indicator_info = "I",
	indicator_hint = "H",
})
