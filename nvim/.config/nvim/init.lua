require("vim._core.ui2").enable({})

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("keymaps")

require("colorscheme")
require("pack")
require("lsp")
require("formatter")
