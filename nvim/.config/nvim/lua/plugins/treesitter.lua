return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
    },
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "cpp",
          "lua",
          "vim",
          "vimdoc",
        },
        auto_install = true,

        highlight = {
          enable = true,
          -- Disable slow treesitter highlight for large files
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = true,
        },

        textobjects = {
          select = {
            enable = true,
            lookahead = true,

            -- this just has everything, delete if not necessary
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",

              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",

              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",

              ["ai"] = "@conditional.outer", -- [i]f
              ["ii"] = "@conditional.inner",

              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",

              ["ap"] = "@parameter.outer",
              ["ip"] = "@parameter.inner",

              ["aC"] = "@call.outer",
              ["iC"] = "@call.inner",

              ["a="] = "@assignment.outer",
              ["i="] = "@assignment.inner",

              ["as"] = "@statement.outer",
              ["is"] = "@statement.inner",

              ["at"] = "@comment.outer", -- [t]ext
              ["it"] = "@comment.inner", -- [t]ext
            },
            selection_modes = {
              ["@parameter.outer"] = "v", -- charwise
              ["@function.outer"] = "V", -- linewise
              ["@class.outer"] = "<c-v>", -- blockwise
            },
            include_surrounding_whitespace = true,
          },
          -----------------------------------
          -- swap node under cursor with the next/prev
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner", -- [a]rgument
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
          -----------------------------------
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
              ["]l"] = "@loop.outer",
              ["]i"] = "@conditional.outer",
              ["]b"] = "@block.outer",
              ["]a"] = "@assignment.outer",
              ["]s"] = "@statement.outer",
              ["]p"] = "@parameter.outer",
              ["]C"] = "@call.outer",
            },
            goto_next_end = {
              ["]F"] = "@function.outer",
              ["]L"] = "@loop.outer",
              ["]I"] = "@conditional.outer",
              ["]B"] = "@block.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
              ["[l"] = "@loop.outer",
              ["[i"] = "@conditional.outer",
              ["[b"] = "@block.outer",
              ["[a"] = "@assignment.outer",
              ["[s"] = "@statement.outer",
              ["[p"] = "@parameter.outer",
              ["[C"] = "@call.outer",
            },
            goto_previous_end = {
              ["[F"] = "@function.outer",
              ["[L"] = "@loop.outer",
              ["[I"] = "@conditional.outer",
              ["[B"] = "@block.outer",
            },
          },
          ---------------------------------
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
}
