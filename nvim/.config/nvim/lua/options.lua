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

vim.diagnostic.config({
  -- virtual_lines = true, -- this gets messy on large code base with tons of errors
  -- Select either virtual lines or text below otherwise it gets messy
  virtual_text = {
    spacing = 4,
    prefix = "●", -- This is fine as a string
  },

  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})
