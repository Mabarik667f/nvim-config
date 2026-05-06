-- Core
require("core.options")
require("core.plugins")
require("keys.alias")

--Plugins
require("plugins.lsp")
require("plugins.bufferline")
require("plugins.cmp")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.gitsigns")
require("plugins.neo-tree")
require("plugins.theme")
require("plugins.formatters")
require("plugins.treesitter")
require("plugins.nvim-ts-autotag")

vim.diagnostic.config({ virtual_text = true })
vim.notify = function(msg, level, opts)
	vim.api.nvim_echo({ { msg } }, true, {})
end
