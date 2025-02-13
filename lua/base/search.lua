local opt = vim.opt

local g = vim.g

-- ignorecase during the search, example: word we search word, Word, WORD etc.
opt.ignorecase = true

-- if we you title, for exapmle: Word we search Word, not word or wORD
opt.smartcase = true

-- highlighting brackets after create
opt.showmatch = true

-- highlighting findend strings
opt.hlsearch = true
