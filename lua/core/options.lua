local opt = vim.opt
local g = vim.g
local env = vim.env

------------------------------
-- General
------------------------------
g.mapleader = " "
g.maplocalleader = " "
opt.mouse = "a" --mouse enable
opt.clipboard = "unnamedplus" --shared global clipboard

------------------------------
-- UI
------------------------------
opt.relativenumber = true
opt.number = true
opt.breakindent = true --wrapped line will continue visually indented

------------------------------
-- Search
------------------------------
opt.ignorecase = true -- ignorecase during the search, example: word we search word, Word, WORD etc.
opt.smartcase = true -- if we you title, for exapmle: Word we search Word, not word or wORD
opt.showmatch = true -- highlighting brackets after create
opt.hlsearch = true -- highlighting findend strings

------------------------------
-- Tabs
------------------------------
opt.tabstop = 2 -- spaces after tab, if softtabstop gt than tabstop
opt.softtabstop = 2 -- ">>" tab or "<<" tab
opt.shiftwidth = 2
opt.expandtab = true

------------------------------
-- Other
------------------------------
env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
env.NVIM_TUI_ENABLE_CLIPBOARD = 1

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"html",
		"css",
		"markdown",
		"yaml",
		"vue",
	},
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		opt.expandtab = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"python",
	},
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
		opt.expandtab = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"rust",
	},
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
		opt.expandtab = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"go",
	},
	callback = function()
		vim.opt_local.tabstop = 8
		vim.opt_local.softtabstop = 8
		vim.opt_local.shiftwidth = 8
		opt.expandtab = false
	end,
})
