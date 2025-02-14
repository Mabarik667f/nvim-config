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
	{
		"folke/lazydev.nvim",
		ft = "lua"
	},
	{ "hrsh7th/nvim-cmp" },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "L3MON4D3/LuaSnip" },
	{ "ThePrimeagen/vim-be-good" },
	{ "nvim-lualine/lualine.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "nvim-lua/lsp-status.nvim" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "folke/tokyonight.nvim" },
	{ "NeogitOrg/neogit" },
	{ "nvim-lua/plenary.nvim" },
	{ "sindrets/diffview.nvim" },
	{ "nvim-telescope/telescope.nvim" },
	{ "ibhagwan/fzf-lua" },
	{ "nvim-tree/nvim-tree.lua" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "nvimtools/none-ls.nvim" },
	{ "windwp/nvim-ts-autotag" },
	{ "lewis6991/gitsigns.nvim" },
	{ "williamboman/mason.nvim" },
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
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = 'make'
	}

})
