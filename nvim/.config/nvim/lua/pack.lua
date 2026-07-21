-- Mini Icons
vim.pack.add({ "https://github.com/nvim-mini/mini.icons" })

-- Gitsigns
vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

-- Highlight Colors
vim.pack.add({ "https://github.com/brenoprata10/nvim-highlight-colors" })
require("nvim-highlight-colors").setup({})

-- Todo Comments
vim.pack.add({ "https://github.com/folke/todo-comments.nvim" })
require("todo-comments").setup()

-- Statusline
vim.pack.add({ "https://github.com/nvim-mini/mini.statusline" })
require("mini.statusline").setup()

-- Oil
vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
require("oil").setup({ vim.keymap.set("n", "-", ":Oil<cr>") })

-- Which-Key
vim.pack.add({ "https://github.com/folke/which-key.nvim" })
require("which-key").setup()

-- Mini ai
vim.pack.add({ "https://github.com/nvim-mini/mini.ai" })
require("mini.ai").setup()

-- Mini Surround
vim.pack.add({ "https://github.com/nvim-mini/mini.surround" })
require("mini.surround").setup()

-- Friendly Snippets
vim.pack.add({ "https://github.com/rafamadriz/friendly-snippets" })

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
  sources = {
    providers = {
      snippets = {
        opts = {
          extended_filetypes = {
            razor = { "html" },
            csproj = { "html" },
          },
        },
      },
    },
  },
  completion = {
    menu = {
      draw = {
        components = {
          -- customize the drawing of kind icons
          kind_icon = {
            text = function(ctx)
              -- default kind icon
              local icon = ctx.kind_icon
              -- if LSP source, check for color derived from documentation
              if ctx.item.source_name == "LSP" then
                local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                if color_item and color_item.abbr ~= "" then
                  icon = color_item.abbr
                end
              end
              return icon .. ctx.icon_gap
            end,
            highlight = function(ctx)
              -- default highlight group
              local highlight = "BlinkCmpKind" .. ctx.kind
              -- if LSP source, check for color derived from documentation
              if ctx.item.source_name == "LSP" then
                local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                if color_item and color_item.abbr_hl_group then
                  highlight = color_item.abbr_hl_group
                end
              end
              return highlight
            end,
          },
        },
      },
    },
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
