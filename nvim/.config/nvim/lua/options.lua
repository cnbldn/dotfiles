vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

vim.opt.laststatus = 3

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

vim.opt.clipboard:append("unnamedplus")
vim.opt.isfname:append("@-@")
vim.opt.mouse = "a"
-- vim.opt.guicursor = ""
vim.opt.scrolloff = 4

vim.opt.colorcolumn = "0"
vim.opt.signcolumn = "yes"
vim.o.cmdheight = 0

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.o.winborder = "rounded"

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  },
})
