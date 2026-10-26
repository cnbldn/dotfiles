return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
      { "j-hui/fidget.nvim", opts = {} },
    },
    opts = {
      ensure_installed = {},
      automatic_enable = true,
    },
    config = function(_, opts)
      -- disable lua_ls formatting bc stylua better
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            format = {
              enable = false,
            },
          },
        },
      })
      -- This comes AFTER all the overrides above
      require("mason-lspconfig").setup(opts)
    end,
  },
  --
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  --
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim" },
    config = function() require("easy-dotnet").setup() end,
  },
}
