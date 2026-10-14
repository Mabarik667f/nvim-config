return {
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    opts = function()
      local actions = require("diffview.actions")

      return {
        keymaps = {
          view = {
            -- { "n", "q", actions.close, { desc = "Close Diffview" } },
            { "n", "q", "<Cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
          },

          file_panel = {
            -- { "n", "q", actions.close, { desc = "Close Diffview" } },
            { "n", "q", "<Cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
          },

          file_history_panel = {
            -- { "n", "q", actions.close, { desc = "Close Diffview" } },
            { "n", "q", "<Cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
          },

          option_panel = {
            { "n", "q", actions.close, { desc = "Close options panel" } },
          },

          help_panel = {
            { "n", "q", actions.close, { desc = "Close help panel" } },
          },
        },
      }
    end,
  },
}
