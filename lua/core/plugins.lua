local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
  debug = true,
  { "folke/lazydev.nvim",             ft = "lua" },
  { "hrsh7th/nvim-cmp" },
  { "nvim-treesitter/nvim-treesitter" },
  { "L3MON4D3/LuaSnip" },
  { "ThePrimeagen/vim-be-good" },
  { "nvim-lualine/lualine.nvim" },
  { "neovim/nvim-lspconfig" },
  { "nvim-lua/lsp-status.nvim" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "saadparwaiz1/cmp_luasnip" },
  { "NeogitOrg/neogit" },
  { "folke/tokyonight.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "sindrets/diffview.nvim" },
  { "nvim-pack/nvim-spectre" },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "isak102/telescope-git-file-history.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "tpope/vim-fugitive",
        },
      },
    },
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = false,
  },
  { "ibhagwan/fzf-lua" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
  },
  { "nvimtools/none-ls.nvim" },
  { "windwp/nvim-ts-autotag" },
  { "lewis6991/gitsigns.nvim" },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "folke/which-key.nvim",
    opts = {},
  },
  {
    "stevearc/conform.nvim",
    opts = {},
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
})
