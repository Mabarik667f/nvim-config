require("bufferline").setup {
  options = {
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
    offsets = { { filetype = "neo-tree", text = "Explorer", padding = 1 } },
  }
}
vim.keymap.set("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { silent = true })
vim.keymap.set("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { silent = true })
vim.keymap.set("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { silent = true })
vim.keymap.set("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { silent = true })
vim.keymap.set("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { silent = true })
vim.keymap.set("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { silent = true })
vim.keymap.set("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { silent = true })
vim.keymap.set("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { silent = true })
vim.keymap.set("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { silent = true })
vim.keymap.set("n", "<leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>", { silent = true })

vim.keymap.set("n", "<leader>[b", "<Cmd>BufferLineCycleNext", { silent = true })
vim.keymap.set("n", "<leader>b]", "<Cmd>BufferLineCyclePrev", { silent = true })
