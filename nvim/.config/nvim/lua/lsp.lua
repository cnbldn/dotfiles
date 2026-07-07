vim.pack.add({ "https://github.com/mason-org/mason.nvim" })
require("mason").setup()

vim.lsp.enable({
  "lua_ls",
  "clangd",
})
