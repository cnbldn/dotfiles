vim.pack.add({ "https://github.com/mason-org/mason.nvim" })
require("mason").setup()

vim.lsp.enable({
  "lua_ls",
  "clangd",
})

-- Easy Dotnet
vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" })
vim.pack.add({ "https://github.com/GustavEikaas/easy-dotnet.nvim" })
require("easy-dotnet").setup()
