local ok, conform = pcall(require, "conform")
if ok then
  conform.setup({
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black", "isort", "ruff" },
      rust = { "rustfmt" },
      go = { "gofmt" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      nix = { "nixpkgs_fmt" },
      vue = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      markdown = { "prettier" },
      yaml = { "prettier" },
    },
  })
else
  vim.notify("conform failed to load: " .. conform, vim.log.levels.ERROR)
end

--- commands ---

-- Disable Formatter
vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

-- Enable Formatter
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})
