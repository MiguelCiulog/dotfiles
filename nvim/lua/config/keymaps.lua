-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Delete without yank
map("n", "<leader>d", '"_d')
map("v", "<leader>d", '"_d')
map("o", "<leader>d", '"_d')
map("n", "x", '"_x')
map("n", "X", '"_X')

map("n", "<leader>c", '"_c')
map("v", "<leader>c", '"_c')
map("o", "<leader>c", '"_c')
map("n", "<leader>C", '"_C')
map("v", "<leader>C", '"_C')
map("o", "<leader>C", '"_C')

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

-- go to beginning and end
map("i", "<C-h>", "<ESC>^i")
map("i", "<C-l>", "<End>")

-- formatting
map("n", "==", "<Cmd>LazyFormat<CR>", { desc = "Format" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

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

-----------------------------------------------------
-------------- Default lazyvim keymaps --------------
-----------------------------------------------------

-- This file is automatically loaded by lazyvim.config.init

-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- formatting
map({ "n", "v" }, "<leader>cf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- stylua: ignore start

-- toggle options
LazyVim.toggle.map("<leader>uf", LazyVim.toggle.format())
LazyVim.toggle.map("<leader>uF", LazyVim.toggle.format(true))
LazyVim.toggle.map("<leader>us", LazyVim.toggle("spell", { name = "Spelling" }))
LazyVim.toggle.map("<leader>uw", LazyVim.toggle("wrap", { name = "Wrap" }))
LazyVim.toggle.map("<leader>uL", LazyVim.toggle("relativenumber", { name = "Relative Number" }))
LazyVim.toggle.map("<leader>ud", LazyVim.toggle.diagnostics)
LazyVim.toggle.map("<leader>ul", LazyVim.toggle.number)
LazyVim.toggle.map( "<leader>uc", LazyVim.toggle("conceallevel", { values = { 0, vim.o.conceallevel > 0 and vim.o.conceallevel or 2 } }))
LazyVim.toggle.map("<leader>uT", LazyVim.toggle.treesitter)
LazyVim.toggle.map("<leader>ub", LazyVim.toggle("background", { values = { "light", "dark" }, name = "Background" }))
if vim.lsp.inlay_hint then
  LazyVim.toggle.map("<leader>uh", LazyVim.toggle.inlay_hints)
end

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

