local map = vim.api.nvim_set_keymap
local main = {}

function main.nm(key, command)
	map('n', key, command, { noremap = true })
end

function main.im(key, command)
	map('i', key, command, { noremap = true })
end

function main.vm(key, command)
	map('v', key, command, { noremap = true })
end

function main.tm(key, command)
	map('t', key, command, { noremap = true })
end

return main
