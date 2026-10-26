return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {},
  },
  -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#general
  keys = {
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>?", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
  },
}
