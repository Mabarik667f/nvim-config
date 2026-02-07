return {
  cmd = { "golangci_lint_ls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
  root_markers = { "go.mod", "go.work" },
  flags = {
    debounce_text_changes = 500,
  },
}
