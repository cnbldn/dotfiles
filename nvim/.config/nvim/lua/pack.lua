-- Mini Icons
vim.pack.add({ "https://github.com/nvim-mini/mini.icons" })

-- Gitsigns
vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

-- Todo Comments
vim.pack.add({ "https://github.com/folke/todo-comments.nvim" })
require("todo-comments").setup()

-- Statusline
vim.pack.add({ "https://github.com/nvim-mini/mini.statusline" })
require("mini.statusline").setup()

-- Oil
vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
require("oil").setup({
  vim.keymap.set("n", "-", ":Oil<cr>"),
})

-- Blink.cmp (autocomplete)
vim.pack.add({ "https://github.com/saghen/blink.lib", "https://github.com/saghen/blink.cmp" })
local cmp = require("blink.cmp")
cmp.build():pwait()
cmp.setup({
  signature = { enabled = true },
  keymap = {
    preset = "default",
    ["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" },
    -- ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    -- ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
  },
})

-- Snacks
vim.pack.add({ "https://github.com/folke/snacks.nvim" })
local Snacks = require("snacks")
Snacks.setup({
  picker = { enabled = true },
})
-- stylua: ignore start
vim.keymap.set("n", "<leader><leader>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>,", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>?", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
-- stylua: ignore end
