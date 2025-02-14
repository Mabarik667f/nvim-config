require("conform").setup({
	format_on_save = {
		timemout_ms = 500,
		lsp_format = "fallback"
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "isort" },
		rust = { "rustfmt" },
		go = { "gofmt", "goimports" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		vue = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		markdown = { "prettier" },
		yaml = { "prettier" }
	}
})

