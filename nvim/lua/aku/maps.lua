local map = require("aku.binds").map

-- Delete without yank
map('n', '<leader>d', '"_d')
map('v', '<leader>d', '"_d')
map('o', '<leader>d', '"_d')
map('n', 'x', '"_x')
map('n', 'X', '"_X')

map('n', '<leader>c', '"_c')
map('v', '<leader>c', '"_c')
map('o', '<leader>c', '"_c')
map('n', '<leader>C', '"_C')
map('v', '<leader>C', '"_C')
map('o', '<leader>C', '"_C')

-- Paste from the clipboard
map('n', '<leader>p', '"+p', {silent = true})
map('n', '<leader>P', '"+P', {silent = true})

-- Yank to clipboard
map('n', '<leader>y', '"+y', {silent = true})
map('n', '<leader>Y', '"+Y', {silent = true})

-- Select everything ggVG
map('n', '<c-a>', 'ggVG')

-- Remap go to end of line ($) and go to start of line (^)
map('n', 'H', '^')
map('n', 'L', '$')
map('v', 'H', '^')
map('v', 'L', '$')

-- c-s to save in normal mode
map('n', '<c-s>', ':w<Enter>')
map('i', '<c-s>', '<Esc>:w<Enter>a')

-- Press s to add an extra line
-- The o<Esc>^Da is for deleting comments on the start of the line
map('n', '<c-Space>', 'o<Esc>^"_D')

-- Backspace in visual mode deletes selection
map('v', '<BS>', 'd')

-- active c-backspace and alt-kspace to delete
map('i', '<C-BS>', '<C-o>db') -- TODO
map('i', '<C-Del>', '<C-o>dw')

-- Close the current buffer and move to the previous one
-- This replicates the idea of closing a tab
map('n', '<leader>bd', ':bp <BAR> bd #<CR>', {silent = true})
-- Force quit
map('n', '<leader>bD', ':bp <BAR> bd! #<CR>', {silent = true})

-- Change buffer to next/previous
-- map('n', '<C-p>', ':bnext<CR>', {silent = true})
-- map('n', '<C-n>', ':bprevious<CR>', {silent = true})

-- Add/remove tab/workspace
map('n', '<leader>tn', ':tabnew | Telescope find_files<CR>', {silent = true})
map('n', '<leader>td', ':tabclose<CR>', {silent = true})

-- go to beginning and end
map('i', '<C-h>', '<ESC>^i')
map('i', '<C-l>', '<End>')

-- Function to trim extra whitespace in whole file
vim.cmd [[
function! Trim()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
]]

vim.cmd "command! -nargs=0 Trim call Trim()"


