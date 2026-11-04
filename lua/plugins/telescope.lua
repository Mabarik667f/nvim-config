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
      -- Files
      { "<leader>ff", "<cmd>Telescope find_files<cr>",                desc = "Find files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                  desc = "Recent files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",                   desc = "Buffers" },

      -- Search
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",                 desc = "Search project" },
      { "<leader>fw", "<cmd>Telescope grep_string<cr>",               desc = "Search word under cursor" },
      { "<leader>fp", "<cmd>Telescope resume<cr>",                    desc = "Resume previous search" },
      { "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search current file" },
      {
        "<leader>fS",
        function()
          require("telescope.builtin").live_grep({
            grep_open_files = true,
            prompt_title = "Search in open buffers",
          })
        end,
        desc = "Search open buffers",
      },

      -- LSP
      { "<leader>fR", "<cmd>Telescope lsp_references<cr>", desc = "Find references" },
      {
        "<leader>fo",
        "<cmd>Telescope lsp_document_symbols<cr>",
        desc = "Document symbols",
      },

      -- Git
      {
        "<leader>fd",
        function()
          require("telescope").extensions.git_file_history.git_file_history()
        end,
        desc = "Git file history",
      },

      -- Neovim
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",      desc = "Help tags" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>",        desc = "Keymaps" },
      { "<leader>fc", "<cmd>Telescope commands<cr>",       desc = "Commands" },
    },

    config = function()
      local telescope = require("telescope")

      telescope.setup({
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
