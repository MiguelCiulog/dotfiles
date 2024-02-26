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
map("n", "H", "^")
map("n", "L", "$")
map("v", "H", "^")
map("v", "L", "$")

-- c-s to save in normal mode
map("n", "<c-s>", ":w<Enter>")
map("i", "<c-s>", "<Esc>:w<Enter>a")

-- Press s to add an extra line
-- The o<Esc>^Da is for deleting comments on the start of the line
map("n", "<c-Space>", 'o<Esc>^"_D')

-- Backspace in visual mode deletes selection
map("v", "<BS>", "d")

-- active c-backspace and alt-kspace to delete
map("i", "<C-BS>", "<C-o>db") -- TODO
map("i", "<C-Del>", "<C-o>dw")

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

-- Function to trim extra whitespace in whole file
vim.cmd([[
function! Trim()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
]])

vim.cmd("command! -nargs=0 Trim call Trim()")

-- formatting
map({ "n", "v" }, "<leader>fr", function()
  require("lazyvim.util").format({ force = true })
end, { desc = "Format" })

-----------------------------------------------------
-------------- Removing cringe keymaps --------------
-----------------------------------------------------

local d_map = vim.keymap.del
d_map("n", "<leader>K")
d_map("n", "<leader>cf")

-- Move to window using the <ctrl> hjkl keys
d_map("n", "<C-h>")
d_map("n", "<C-j>")
d_map("n", "<C-k>")
d_map("n", "<C-l>")

-- Resize window using <ctrl> arrow keys
d_map("n", "<C-Up>")
d_map("n", "<C-Down>")
d_map("n", "<C-Left>")
d_map("n", "<C-Right>")

-- Move Lines
d_map("n", "<A-j>")
d_map("n", "<A-k>")
d_map("i", "<A-j>")
d_map("i", "<A-k>")
d_map("v", "<A-j>")
d_map("v", "<A-k>")

-- buffers
d_map("n", "<S-h>")
d_map("n", "<S-l>")
d_map("n", "[b")
d_map("n", "]b")
d_map("n", "<leader>bb")
d_map("n", "<leader>`")

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
d_map("n", "<leader>ur")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
d_map("n", "n")
d_map("x", "n")
d_map("o", "n")
d_map("n", "N")
d_map("x", "N")
d_map("o", "N")

-- Add undo break-points
d_map("i", ",")
d_map("i", ".")
d_map("i", ";")

-- better indenting
d_map("v", "<")
d_map("v", ">")

-- lazy
d_map("n", "<leader>l")

-- new file
d_map("n", "<leader>fn")

d_map("n", "<leader>xl")
d_map("n", "<leader>xq")

d_map("n", "[q")
d_map("n", "]q")

-- toggle options
d_map("n", "<leader>uf")
d_map("n", "<leader>uF")
d_map("n", "<leader>us")
d_map("n", "<leader>uw")
d_map("n", "<leader>uL")
d_map("n", "<leader>ul")
d_map("n", "<leader>ud")
d_map("n", "<leader>uc")
if vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint then
  d_map("n", "<leader>uh")
end
d_map("n", "<leader>uT")
d_map("n", "<leader>ub")

-- lazygit
d_map("n", "<leader>gg")
d_map("n", "<leader>gG")

-- quit
d_map("n", "<leader>qq")

-- highlights under cursor
d_map("n", "<leader>ui")

-- LazyVim Changelog
d_map("n", "<leader>L")

-- floating terminal
d_map("n", "<leader>ft")
d_map("n", "<leader>fT")
d_map("n", "<c-/>")
d_map("n", "<c-_>")

-- Terminal d_mappings
d_map("t", "<esc><esc>")
d_map("t", "<C-h>")
d_map("t", "<C-j>")
d_map("t", "<C-k>")
d_map("t", "<C-l>")
d_map("t", "<C-/>")
d_map("t", "<c-_>")

-- windows
d_map("n", "<leader>ww")
d_map("n", "<leader>wd")
d_map("n", "<leader>w-")
d_map("n", "<leader>w|")
d_map("n", "<leader>-")
d_map("n", "<leader>|")

-- tabs
d_map("n", "<leader><tab>l")
d_map("n", "<leader><tab>f")
d_map("n", "<leader><tab><tab>")
d_map("n", "<leader><tab>]")
d_map("n", "<leader><tab>d")
d_map("n", "<leader><tab>[")
