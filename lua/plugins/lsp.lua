local okcfg, lspconfig = pcall(require, "lspconfig")

if okcfg then
  local okstatus, lspstatus = pcall(require, "lsp-status")
  if okstatus then
    lspstatus.config({
      status_symbol = "lsp",
      indicator_errors = "e",
      indicator_warnings = "w",
      indicator_info = "i",
      indicator_hint = "h",
    })

    local capabilities =
        vim.tbl_extend("keep", lspstatus.capabilities, require("cmp_nvim_lsp").default_capabilities())

    capabilities.textDocument.semanticTokens = {
      multilineTokenSupport = true,
    }

    vim.lsp.config("*", {
      capabilities = capabilities,
      root_markers = { ".git" },
    })

    local servers = {
      "ruff",
      "rust_analyzer",
      "dockerls",
      "docker_compose_language_service",
      "vls",
      "clangd",
      "tailwindcss",
      "ts_ls",
      "pyright",
      "gopls",
      "golangci_lint_ls",
      "nil_ls",
      "lua_ls",
      "jsonls",
    }

    vim.lsp.enable(servers)

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
