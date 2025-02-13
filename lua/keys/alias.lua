local main = require("keys/main")

-- off highlighting
main.nm("<Esc>", ":noh<CR>")

-- movement
main.nm("<S-Tab>", "<<")
main.vm("<S-Tab>", "<gv")
main.nm("<Tab>", ">>")
main.vm("<Tab>", ">gv")

-- autocomplete select option
main.nm("<A-k>", ":m .-2<CR>==")
main.vm("<A-k>", ":m '<-2<CR>gv=gv")
main.nm("<A-j>", ":m .+1<CR>==")
main.vm("<A-j>", ":m '>+1<CR>gv=gv")
