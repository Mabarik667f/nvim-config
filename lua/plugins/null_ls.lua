local ok, none_ls = pcall(require, "null-ls")
if not ok then
  vim.notify("null-ls failed to load: " .. none_ls, vim.log.levels.ERROR)
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

none_ls.setup({
  debounce = 500,
  sources = {
    none_ls.builtins.diagnostics.golangci_lint.with({
      condition = function()
        return vim.fn.executable("golangci-lint") == 1
      end,
    }),

    none_ls.builtins.formatting.gofmt,
    none_ls.builtins.formatting.gofumpt,
    none_ls.builtins.formatting.goimports_reviser,
    none_ls.builtins.formatting.golines,

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
    none_ls.builtins.formatting.nixpkgs_fmt.with({
      condition = function()
        return vim.fn.executable("nixpkgs_fmt") == 1
      end,
    }),
    none_ls.builtins.code_actions.gitsigns,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
