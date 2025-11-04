local okcfg, lspconfig = pcall(require, "lspconfig")

local configs = require 'lspconfig/configs'
if not configs.golangcilsp then
  configs.golangcilsp = {
    default_config = {
      cmd = { 'golangci-lint-langserver' },
      root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
      init_options = {
        command = { "golangci-lint", "run", "--output.json.path", "stdout", "--show-stats=false", "--issues-exit-code=1" },
      },
    }
  }
end

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

    lspconfig.golangci_lint_ls.setup {
      filetypes = { 'go', 'gomod' }
    }

    lspconfig.nil_ls.setup({
      settings = {
        ['nil'] = {
          formatting = {
            command = { "nixfmt" }
          }
        }
      }
    })

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
