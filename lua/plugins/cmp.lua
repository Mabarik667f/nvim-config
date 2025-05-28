local cmp = require 'cmp'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)
cmp.setup {
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = "buffer" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "nvim_lua" },
		{ name = "calc" },
	},
	mapping = cmp.mapping.preset.insert({
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
	}),
}
