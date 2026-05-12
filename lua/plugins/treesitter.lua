return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "MeanderingProgrammer/treesitter-modules.nvim",
    },
    config = function()
      vim.treesitter.language.register("c_sharp", { "csharp", "c_sharp" })

      local languages = {
        "bash",
        "c",
        "css",
        "diff",
        "dockerfile",
        "gitignore",
        "graphql",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "nu",
        "printf",
        "python",
        "query",
        "regex",
        "sql",
        "toml",
        "jsx",
        "tsx",
        "javascript",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "go",
        "rust",
      }

      -- Covers ensure_installed + highlight + indent + fold + incremental selection
      local ts = require("treesitter-modules")
      ts.setup({
        ensure_installed = languages,
        ignore_install = {},
        sync_install = false,
        auto_install = false,

        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        fold = {
          enable = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      })

      -- autotag
      require("nvim-ts-autotag").setup()

      -- textobjects plugin now uses its own setup + keymaps
      require("nvim-treesitter-textobjects").setup({
        move = {
          set_jumps = false,
        },
        select = {
          lookahead = true,
        },
      })
    end
  }
}
