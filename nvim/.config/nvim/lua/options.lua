-- TODO: Organize these into better chunks
require("vim._core.ui2").enable({ enable = true })
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.cmdheight = 0
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 4

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.opt.inccommand = "split"

vim.opt.clipboard:append("unnamedplus")
vim.opt.mouse = "a"

vim.opt.undofile = true
vim.opt.confirm = true

vim.o.winborder = "rounded"

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = true,
  jump = { float = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  },
})
