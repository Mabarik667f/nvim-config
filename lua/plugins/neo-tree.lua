require("neo-tree").setup({
  close_if_last_window = false,
  filesystem = {
    follow_current_file = { enabled = true },
    filtered_items = {
      hide_dotfiles = false,
    },
    window = {
      position = "float",
      mappings = {
        ["P"] = {
          "toggle_preview",
          config = {
            use_float = true,
            use_snacks_image = true,
            use_image_nvim = true,
            border = "rounded",
            width = 50,
            height = 20,
          },
        },
        ["l"] = "focus_preview",
      },
    },
  },
})

vim.api.nvim_set_keymap("n", "<C-f>", ":Neotree focus<CR>", { noremap = true, silent = true })
