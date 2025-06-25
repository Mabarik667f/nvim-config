--vim.cmd([[colorscheme tokyonight-storm]])
vim.cmd("colorscheme cyberdream")

local colors = {
	_function = "#FFD700",
	field = "#ADFF2F",
	method = "#00BFFF",
	parameter = "#87CEEB",
	var = "#F72DEA",
}

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		--- LSP ---
		vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = colors.var })
		vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = colors.parameter, italic = true })
		vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = colors.field, bold = true })

		--- Treesitter ---
		vim.api.nvim_set_hl(0, "@function", { fg = colors._function, bold = true })
		vim.api.nvim_set_hl(0, "@method", { fg = colors.method, italic = true })
		vim.api.nvim_set_hl(0, "@field", { fg = colors.field })
		vim.api.nvim_set_hl(0, "@parameter", { fg = colors.parameter, italic = true })
		vim.api.nvim_set_hl(0, "@variable", { fg = colors.var })
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.defer_fn(function()
			--- LSP ---
			vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = colors.var })
			vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = colors.parameter, italic = true })
			vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = colors.field, bold = true })

			--- Treesitter ---
			vim.api.nvim_set_hl(0, "@function", { fg = colors._function, bold = true })
			vim.api.nvim_set_hl(0, "@method", { fg = colors.method, italic = true })
			vim.api.nvim_set_hl(0, "@field", { fg = colors.field })
			vim.api.nvim_set_hl(0, "@parameter", { fg = colors.parameter, italic = true })
			vim.api.nvim_set_hl(0, "@variable", { fg = colors.var })
		end, 100)
	end,
})
