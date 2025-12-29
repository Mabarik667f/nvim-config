return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
  root_markers = { "go.mod", "go.work" },
  settings = {
    gopls = {
      buildFlags = { "-tags=integration" },
    },
  },
}
