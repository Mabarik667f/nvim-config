return {
  {
    "nvim-mini/mini.map",
    version = "*",
    dependencies = {
      "lewis6991/gitsigns.nvim",
    },

    config = function()
      local map = require("mini.map")

      map.setup({
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.diagnostic({
            error = "DiagnosticFloatingError",
            warn = "DiagnosticFloatingWarn",
            info = "DiagnosticFloatingInfo",
            hint = "DiagnosticFloatingHint",
          }),
          map.gen_integration.gitsigns(),
        },

        window = {
          side = "right",
          width = 12,
          winblend = 15,
          show_integration_count = true,
        },
      })

      local keymap = vim.keymap.set

      keymap("n", "<leader>mo", map.open, {
        desc = "Minimap open",
      })

      keymap("n", "<leader>mc", map.close, {
        desc = "Minimap close",
      })

      keymap("n", "<leader>mm", map.toggle, {
        desc = "Minimap toggle",
      })

      keymap("n", "<leader>mf", map.toggle_focus, {
        desc = "Minimap focus",
      })

      keymap("n", "<leader>mr", map.refresh, {
        desc = "Minimap refresh",
      })

      keymap("n", "<leader>ms", map.toggle_side, {
        desc = "Minimap switch side",
      })
    end,
  },
}
