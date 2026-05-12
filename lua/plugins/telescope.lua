return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "isak102/telescope-git-file-history.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope-fzf-native.nvim",
          "tpope/vim-fugitive",
        },
      },
    },

    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Help tags" },
      {
        "<leader>fd",
        function()
          require("telescope").extensions.git_file_history.git_file_history()
        end,
        desc = "Git file history"
      },
    },

    config = function()
      local telescope = require("telescope")
      local actions = require('telescope.actions')
      local action_state = require('telescope.actions.state')

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-s>"] = function(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                vim.cmd('vsplit ' .. selection.value)
              end
            }
          },
        },
        extensions = {
          git_file_history = {
            browser_command = nil,
          },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        },
      })

      telescope.load_extension("git_file_history")
      telescope.load_extension("fzf")
    end
  },
}
