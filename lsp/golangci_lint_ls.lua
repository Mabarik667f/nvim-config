return {
  cmd = { "golangci_lint_ls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
  root_markers = { "go.mod", "go.work" },
  --  init_options = {
  --    command = { "golangci-lint", "run", "--output.json.path", "stdout", "--show-stats=false", "--issues-exit-code=1" },
  --  },
}
