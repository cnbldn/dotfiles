-- return {
--   {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("tokyonight").setup({
--         style = "moon",
--         transparent = true,
--       })
--       vim.cmd([[colorscheme tokyonight]])
--     end,
--   },
-- }

return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    vim.cmd("colorscheme rose-pine")
  end,
}
