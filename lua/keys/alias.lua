local main = require("keys/main")

vim.keymap.set("n", "gD", vim.lsp.buf.definition, { silent = true, noremap = true })

-- off highlighting
main.nm("<Esc>", ":noh<CR>")
main.nm("<Esc>", ":noh<CR>")

local bufremove = require("mini.bufremove")

-- Delete buffer
vim.keymap.set("n", "<leader>q", function()
  bufremove.delete()
end, { desc = "Delete buffer" })

vim.keymap.set("n", "<leader>Q", function()
  bufremove.delete(0, true)
end, { desc = "Force delete buffer" })

-- movement
main.nm("<S-Tab>", "<<")
main.vm("<S-Tab>", "<gv")
main.nm("<Tab>", ">>")
main.vm("<Tab>", ">gv")

-- rename all vars in file
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)

vim.keymap.set("n", "<leader>lr", "<cmd>lsp restart<CR>", { desc = "Restart LSP" })

local map = vim.keymap.set

-- ==========================================
-- GITSIGNS
-- ==========================================


-- Full buffer blame
map("n", "<leader>gb", "<cmd>Gitsigns blame<CR>", {
  desc = "Git: Buffer blame",
})

map("n", "<leader>gr", function()
  require("gitsigns").reset_hunk()
end, {
  desc = "Git: Reset hunk",
})

-- Reset selected lines (Visual mode)
map("v", "<leader>gr", function()
  require("gitsigns").reset_hunk({
    vim.fn.line("."),
    vim.fn.line("v"),
  })
end, {
  desc = "Git: Reset selected lines",
})

-- Reset entire file
map("n", "<leader>gR", function()
  require("gitsigns").reset_buffer()
end, {
  desc = "Git: Reset entire file",
})

-- ==========================================
-- DIFFVIEW
-- ==========================================

-- Diff current file (working tree)
map("n", "<leader>gd", function()
  vim.cmd("DiffviewOpen -- %")
end, {
  desc = "Git: Diff current file",
})

-- Diff current file against HEAD
map("n", "<leader>gD", function()
  vim.cmd("DiffviewOpen HEAD -- %")
end, {
  desc = "Git: Diff current file vs HEAD",
})

-- Current file history
map("n", "<leader>gf", "<cmd>DiffviewFileHistory %<CR>", {
  desc = "Git: File history",
})

-- Repository history
map("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>", {
  desc = "Git: Repository history",
})

-- Repository diff
map("n", "<leader>gg", "<cmd>DiffviewOpen<CR>", {
  desc = "Git: Repository diff",
})

-- Formatter --

--- hotkeys ---

-- block formatter
local range_formatting = function()
  local start_row, _ = table.unpack(vim.api.nvim_buf_get_mark(0, "<"))
  local end_row, _ = table.unpack(vim.api.nvim_buf_get_mark(0, ">"))
  vim.lsp.buf.format({
    range = {
      ["start"] = { start_row, 0 },
      ["end"] = { end_row, 0 },
    },
    async = true,
  })
end

vim.keymap.set("v", "<leader>f", range_formatting, { desc = "Range Formatting" })

-- toggle formatter
vim.keymap.set("n", "<leader>F", function()
  if vim.b.disable_autoformat or vim.g.disable_autoformat then
    vim.cmd("FormatEnable")
  else
    vim.cmd("FormatDisable")
  end
end, { desc = "Toggle [F]ormat" })
