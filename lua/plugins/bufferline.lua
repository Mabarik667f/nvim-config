return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",

    event = "VeryLazy",

    opts = {
      options = {
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        offsets = {
          { filetype = "neo-tree", text = "Explorer", padding = 1 },
        },
      },
    },

    config = function(_, opts)
      require("bufferline").setup(opts)

      local map = vim.keymap.set

      -- Go to buffer by number
      for i = 1, 9 do
        map("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<cr>", { silent = true, desc = "Buffer " .. i })
      end

      map("n", "<leader>$", "<cmd>BufferLineGoToBuffer -1<cr>", { silent = true, desc = "Last buffer" })

      -- Navigation
      map("n", "<leader>[b", "<cmd>BufferLineCycleNext<cr>", { silent = true, desc = "Next buffer" })
      map("n", "<leader>b]", "<cmd>BufferLineCyclePrev<cr>", { silent = true, desc = "Prev buffer" })
    end,

  },
}
