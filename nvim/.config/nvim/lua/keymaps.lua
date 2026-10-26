local vks = vim.keymap.set

--------------------------------------------------------------------------------
-- Keymaps
--------------------------------------------------------------------------------
vks("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

vks("v", "<", "<gv", { desc = "Unindent and keep selection" })
vks("v", ">", ">gv", { desc = "Indent and keep selection" })

--------------------------------------------------------------------------------
-- User Commands
--------------------------------------------------------------------------------
-- add :Format command
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "never", range = range })
end, { range = true })
--------------------------------------------------------------------------------
-- Autocommands
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  callback = function() vim.hl.on_yank() end,
})
