local main = require("keys/main")

vim.keymap.set("n", "gD", vim.lsp.buf.definition, { silent = true, noremap = true })

-- off highlighting
main.nm("<Esc>", ":noh<CR>")
main.nm("<Esc>", ":noh<CR>")

vim.keymap.set("n", "<leader>q", function()
  vim.api.nvim_buf_delete(0, {})
end, { silent = true })

vim.keymap.set("n", "<leader>Q", function()
  vim.api.nvim_buf_delete(0, { force = true })
end, { silent = true })

-- movement
main.nm("<S-Tab>", "<<")
main.vm("<S-Tab>", "<gv")
main.nm("<Tab>", ">>")
main.vm("<Tab>", ">gv")

-- autocomplete select option
main.nm("<A-k>", "<cmd>silent! move .-2<CR>==")
main.vm("<A-k>", "<cmd>silent! move '<-2<CR>gv=gv")
main.vm("<A-j>", "<cmd>silent! move '>+1<CR>gv=gv")
main.nm("<A-j>", "<cmd>silent! move .+1<CR>==")

-- rename all vars in file
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)

vim.keymap.set("n", "<leader>lr", "<cmd>lsp restart<CR>", { desc = "Restart LSP" })

-- diffview plugin ---
vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory<CR>", { desc = "Diffview: file history" })

vim.keymap.set("n", "<leader>gf", ":DiffviewFileHistory %<CR>", { desc = "Diffview: file history current" })

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
