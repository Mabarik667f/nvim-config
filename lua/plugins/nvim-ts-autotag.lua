local ok, autotag = pcall(require, "nvim-ts-autotag")

if ok then
	autotag.setup({
		opts = {
			enable_close = true,
			enable_rename = true,
			enable_close_on_slash = false,
		},
	})
else
	vim.notify("autotag failed to load:" .. autotag, vim.log.levels.ERROR)
end
