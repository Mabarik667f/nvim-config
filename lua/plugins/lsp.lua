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
  "ts_ls",
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

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local client = vim.lsp.get_clients({ bufnr = 0 })[1]
    local encoding = client and client.offset_encoding or "utf-16"

    local params = vim.lsp.util.make_range_params(0, encoding)
    params.context = { only = { "source.organizeImports" } }
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end
})
