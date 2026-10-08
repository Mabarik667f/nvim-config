return {
  cmd = { "basedpyright-langserver", "--stdio" },

  settings = {
    basedpyright = {
      disableOrganizeImports = true,
    },

    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
      },
    },
  },
}
