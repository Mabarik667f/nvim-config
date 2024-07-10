vim.wo.relativenumber = true 
vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true

vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.breakindent = true

local opts = {noremap = true, silent = true}
vim.keymap.set("n", "<S-Tab>", "<<", opts)
vim.keymap.set("n", "<Tab>", ">>", opts)
vim.keymap.set("v", "<Tab>", ">gv", opts)
vim.keymap.set("v", "<S-Tab>", "<gv", opts)
				
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy..nvim"
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
	"nvim-tree/nvim-web-devicons"
})

local lspconfig = require('lspconfig')
local lspstatus = require('lsp-status')

lspstatus.config({
	status_symbol = 'LSP',
	indicator_errors = 'E',
	indicator_warnings = 'W',
	indicator_info = 'I',
	indicator_hint = 'H',
})

local copabilities = require('cmp_nvim_lsp').default_capabilities()
local luasnip = require 'luasnip'

-- LSP
local servers = {
	"lua_ls",
	"tsserver",
	"pyright",
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
		{name = 'nvim_lsp'},
		{name = "buffer"},
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
vim.cmd[[colorscheme tokyonight-storm]]

--Git


--NvimTree
local nvimtree = require('nvim-tree')
nvimtree.setup{
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


require('telescope').setup{}
