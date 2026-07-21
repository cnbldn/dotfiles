-- vim.pack
vim.keymap.set("n", "<leader>ps", "<cmd>lua vim.pack.update()<CR>")

-- text manip
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting", silent = true })

vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

vim.keymap.set("v", "gh", "<C-w>d", { desc = "Show Diagnostics" })

vim.keymap.set(
  "n",
  "<leader>rp",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word cursor is on globally" }
)

-- format buffer
vim.keymap.set("n", "<Leader>p", ":Format<CR>", { silent = true })

-- undotree
vim.keymap.set("n", "<leader>u", function()
  vim.cmd.packadd("nvim.undotree")
  require("undotree").open()
end, { desc = "Toggle builtin undotree" })

------------------------------------------------------------
--- User Commands
------------------------------------------------------------

--- Open Jetbrains Rider for Debug
vim.api.nvim_create_user_command('DebugRider', function()
  -- Find the root directory using LSP, git, sln, or csproj files
  local project_root = vim.fs.root(0, { ".git", ".sln", ".slnx", ".csproj" }) or vim.fn.getcwd()
  local current_file = vim.api.nvim_buf_get_name(0)
  local line = vim.api.nvim_win_get_cursor(0)[1] -- Get the line number

  -- Ensure we have a valid file before launching
  if current_file == "" then
    vim.notify("No active file to open in Rider", vim.log.levels.WARN)
    return
  end

  -- Construct the CLI command (adjust 'rider' if your binary name is different)
  local cmd = string.format("rider --line %d %q %q &", line, project_root, current_file)

  -- Execute silently in the background
  vim.fn.system(cmd)
  vim.notify("Opening project in JetBrains Rider...")
end, { desc = "Open the current file and project root in JetBrains Rider for debugging" })
-- open ide as debugger
