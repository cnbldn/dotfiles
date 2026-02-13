return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set("n", "<leader>f*", builtin.grep_string, { desc = "Grep Selected String" })

      vim.keymap.set("n", "<leader>fcn", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "Find in Neovim Config" })
      vim.keymap.set("n", "<leader>fcc", function()
        builtin.find_files({ cwd = "/home/cnbldn/.config" })
      end, { desc = "Find in .config Config" })

      vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = "oldfiles" })
      vim.keymap.set("n", "<leader> ", builtin.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })

      -- lsp
      vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "LSP references" })
      vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "LSP definitions" })
      vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "LSP implementations" })
      vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "Document symbols" })
      vim.keymap.set(
        "n",
        "<leader>ws",
        builtin.lsp_workspace_symbols,
        { desc = "Workspace symbols" }
      )
    end,
  },
}
