vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.confirm = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
-- vim.opt.softtabstop = 4
-- vim.opt.smarttab = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.winborder = "rounded"

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Sync clipboard with os
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

vim.opt.termguicolors = true
