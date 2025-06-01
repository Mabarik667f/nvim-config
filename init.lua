-- Core
require("core.options")
require("core.plugins")
require("keys.alias")

--Plugins
require("plugins.lsp")
require("plugins.null_ls")
require("plugins.cmp")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.gitsigns")
require("plugins.nvimtree")
require("plugins.theme")
require("plugins.formatters")
require("plugins.treesitter")
require("plugins.typescript-tools")
require("plugins.nvim-ts-autotag")

vim.diagnostic.config({ virtual_text = true })
--vim.lsp.set_log_level("debug")
vim.notify = function(msg, level, opts)
	vim.api.nvim_echo({ { msg } }, true, {})
end
