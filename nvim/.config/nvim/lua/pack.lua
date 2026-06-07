-- Mini Icons
vim.pack.add({ "https://github.com/nvim-mini/mini.icons" })

-- Gitsigns
vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

-- Statusline
vim.pack.add({ "https://github.com/nvim-mini/mini.statusline" })
require("mini.statusline").setup()

-- Oil
vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
require("oil").setup({
  vim.keymap.set("n", "-", ":Oil<cr>"),
})

-- Treesitter
vim.pack.add({ "https://github.com/romus204/tree-sitter-manager.nvim" })
require("tree-sitter-manager").setup({
  auto_install = true,
})
