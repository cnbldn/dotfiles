return {
  ---@module 'lazy'
  ---@type LazySpec
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  ---@module 'lazy'
  ---@type LazySpec
  {
    "lukas-reineke/indent-blankline.nvim",
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = "ibl",
    ---@module 'ibl'
    ---@type ibl.config
    opts = {},
  },
}
