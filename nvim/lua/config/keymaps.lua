-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Delete without yank
map("n", "d", '"_d')
map("v", "d", '"_d')
-- map("o", "<leader>d", '"_d')
map("n", "x", '"_x')
map("n", "X", '"_X')

map("n", "c", '"_c')
map("v", "c", '"_c')
-- map("o", "<leader>c", '"_c')
map("n", "C", '"_C')
map("v", "C", '"_C')
-- map("o", "<leader>C", '"_C')

-- Paste from the clipboard
map("n", "<leader>p", '"+p', { silent = true })
map("n", "<leader>P", '"+P', { silent = true })

-- Yank to clipboard
map("n", "<leader>y", '"+y', { silent = true })
map("n", "<leader>Y", '"+Y', { silent = true })

-- Remap go to end of line ($) and go to start of line (^)
map("v", "H", "^")
map("v", "L", "$")

-- Close the current buffer and move to the previous one
-- This replicates the idea of closing a tab
map("n", "<leader>bd", ":bp <BAR> bd #<CR>", { silent = true })
-- Force quit
map("n", "<leader>bD", ":bp <BAR> bd! #<CR>", { silent = true })

-- Change buffer to next/previous
map("n", "<C-p>", ":bnext<CR>", { silent = true })
map("n", "<C-n>", ":bprevious<CR>", { silent = true })

-- Add/remove tab/workspace
map("n", "<leader>tn", ":tabnew | Telescope find_files<CR>", { silent = true })
map("n", "<leader>td", ":tabclose<CR>", { silent = true })

-- formatting
map("n", "==", "<Cmd>LazyFormat<CR>", { desc = "Format" })

vim.api.nvim_create_user_command("CopyFullPath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("CopyRelPath", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("CopyGithubCurrFilePath", function()
  -- Get the GitHub repository URL, removing the ".git" suffix
  local repo_url = vim.fn.system("git config --get remote.origin.url | sed -e 's/\\.git$//'")
  repo_url = repo_url:gsub("\n", "")

  -- Get the relative path of the current file in the repository (we use git ls-files in case we are not on the git root directory)
  local file_path = vim.fn.system("git ls-files --full-name " .. vim.fn.expand("%"))
  file_path = file_path:gsub("\n", "")

  -- Get the current branch name
  local branch_name = vim.fn.system("git rev-parse --abbrev-ref HEAD")
  branch_name = branch_name:gsub("\n", "")

  -- Build the full GitHub URL to the file
  local github_url = string.format("%s/blob/%s/%s", repo_url, branch_name, file_path)

  vim.fn.setreg("+", github_url)
  vim.notify('Copied "' .. github_url .. '" to the clipboard!')
end, {})
