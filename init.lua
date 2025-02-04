vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	"ThePrimeagen/vim-be-good",
	"nvim-lualine/lualine.nvim",
	"neovim/nvim-lspconfig",
	"nvim-lua/lsp-status.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"saadparwaiz1/cmp_luasnip",
	"L3MON4D3/LuaSnip",
	"folke/tokyonight.nvim",
	"NeogitOrg/neogit",
	"nvim-lua/plenary.nvim",
	"sindrets/diffview.nvim",
	"nvim-telescope/telescope.nvim",
	"ibhagwan/fzf-lua",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"nvimtools/none-ls.nvim",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true
	},
	{
		"folke/which-key.nvim", opts = {}
	},
	{
		"stevearc/conform.nvim",
		opts = {}
	},

})

require('lualine').setup()


-- Linters
local none_ls = require("null-ls")

none_ls.setup({
	sources = {
		none_ls.builtins.diagnostics.pylint,  -- python
		none_ls.builtins.diagnostics.golangci_lint, -- golang
		none_ls.builtins.diagnostics.textlint, -- text & md
		none_ls.builtins.diagnostics.selene,  -- lua linter
		none_ls.builtins.diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "postgres" }
		}),

		none_ls.builtins.code_actions.gitsigns, -- git pointer
	}
})

-- Flags
vim.wo.relativenumber = true
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
vim.env.NVIM_TUI_ENABLE_CLIPBOARD = 1
vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.opt.number = true

vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.breakindent = true

vim.keymap.set("n", "<S-Tab>", "<<", opts)
vim.keymap.set("n", "<Tab>", ">>", opts)
vim.keymap.set("v", "<Tab>", ">gv", opts)
vim.keymap.set("v", "<S-Tab>", "<gv", opts)

vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- AutoComplete
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

-- LSP
local lspconfig = require('lspconfig')
local lspstatus = require('lsp-status')

lspstatus.config({
	status_symbol = 'LSP',
	indicator_errors = 'E',
	indicator_warnings = 'W',
	indicator_info = 'I',
	indicator_hint = 'H',
})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local luasnip = require 'luasnip'

local servers = {
	"lua_ls",
	"ts_ls",
	"pyright",
	"rust_analyzer",
	"gopls",
	'dockerls',
	'docker_compose_language_service',
	'vls'
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		capabilities = capabilities,
	}
end
-- Cmp
local cmp = require 'cmp'

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = "buffer" },
	},
	mapping = cmp.mapping.preset.insert({
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
	}),
}
-- Theme
vim.cmd [[colorscheme tokyonight-storm]]

--NvimTree
local nvimtree = require('nvim-tree')
nvimtree.setup {
	git = {
		enable = true
	}
}
vim.api.nvim_set_keymap('n', '<C-Space>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':NvimTreeFocus<CR>', { noremap = true, silent = true })

--Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


require('telescope').setup {}
