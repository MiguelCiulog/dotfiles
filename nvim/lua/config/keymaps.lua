-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Cringe
map("n", "x", '"_x')
map("n", "X", '"_X')

-- Delete with register inside neovim, but clipboard only on Yank
map("n", "y", '"+y')
map("v", "y", '"+y')

-- Remap go to end of line ($) and go to start of line (^)
map("n", "H", "^")
map("n", "L", "$")

-- Change buffer to next/previous
map("n", "<C-p>", ":bnext<CR>", { silent = true })
map("n", "<C-n>", ":bprevious<CR>", { silent = true })

map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
map("v", "<", "<gv", { silent = true })
map("v", ">", ">gv", { silent = true })

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
