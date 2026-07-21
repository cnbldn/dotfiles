vim.pack.add {
  { src = "https://github.com/romus204/tree-sitter-manager.nvim" }
}
require("tree-sitter-manager").setup()

-- -- yoinked this from kickstart
-- vim.pack.add({
--   { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
-- })
-- require("nvim-treesitter").setup()
