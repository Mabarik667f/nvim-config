local okCfg, lspconfig = pcall(require, "lspconfig")
if okCfg then
	local okStatus, lspstatus = pcall(require, "lsp-status")
	if okStatus then
		lspstatus.config({
			status_symbol = "LSP",
			indicator_errors = "E",
			indicator_warnings = "W",
			indicator_info = "I",
			indicator_hint = "H",
		})
		local servers = {
			"ruff",
			"rust_analyzer",
			"gopls",
			"dockerls",
			"docker_compose_language_service",
			"vls",
			"clangd",
			"tailwindcss",
			"ts_ls",
		}

		local capabilities =
			vim.tbl_extend("keep", lspstatus.capabilities, require("cmp_nvim_lsp").default_capabilities())

		lspconfig.pyright.setup({
			capabilities = capabilities,
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

	--	local ok, tsApi = pcall(require, "typescript-tools.api")
	--	if ok then
	--		local okTools, tsTools = pcall(require, "typescript-tools")
	--		if okTools then
	--			tsTools.setup({
	--				capabilities = capabilities,
	--				handlers = {
	--					["textDocument/publishDiagnostics"] = tsApi.filter_diagnostics({ 80001 }),
	--				},
	--			})
	--		else
	--			vim.notify("typescript-tools failed to load:" .. tsTools, vim.log.levels.ERROR)
	--		end
	--	else
	--		vim.notify("typescript-tools.api failed to load:" .. tsApi, vim.log.levels.ERROR)
	--	end
	else
		vim.notify("lspstatus failed to load:" .. lspstatus, vim.log.levels.ERROR)
	end
else
	vim.notify("lspconfig failed to load:" .. lspconfig, vim.log.levels.ERROR)
end
