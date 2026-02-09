return {
  {
    -- used for completion, annotations and signatures of Neovim apis
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      {
        "neovim/nvim-lspconfig",
        config = function()
          -- Configure how diagnostics look
          vim.diagnostic.config({
            underline = { severity = vim.diagnostic.severity.ERROR },
            -- Border options: bold, double, none, rounded, shadow, single, solid
            float = { border = "rounded", source = "if_many" },
            virtual_text = {
              spacing = 4,
              source = "if_many",
              prefix = "󰝤 ",
            },
            severity_sort = true,
            signs = {
              text = {
                [vim.diagnostic.severity.ERROR] = "󰅚 ",
                [vim.diagnostic.severity.WARN] = "󰀪 ",
                [vim.diagnostic.severity.INFO] = "󰋽 ",
                [vim.diagnostic.severity.HINT] = "󰌶 ",
              },
            },
          })
        end,
      },
      { "j-hui/fidget.nvim", opts = {} },
    },
  },
}
