local map = require("aku.binds").map

-- Delete without yank
map('n', '<leader>d', '"_d')
map('v', '<leader>d', '"_d')
map('o', '<leader>d', '"_d')
map('n', 'x', '"_x')
map('n', 'X', '"_X')

-- Paste the last thing yanked, not deleted
map('n', '<leader>p', '"0p')
map('n', '<leader>P', '"0P')

-- Select everything ggVG
map('n', '<c-a>', 'ggVG')

-- Remap go to end of line ($) and go to start of line (^)
map('n', 'H', '^')
map('n', 'L', '$')
map('v', 'H', '^')
map('v', 'L', '$')

-- c-s to save in normal mode
map('n', '<c-s>', ':w<Enter>')

-- Press s to add an extra line
-- The o<Esc>^Da is for deleting comments on the start of the line
map('n', '<c-Space>', 'o<Esc>^"_D')

-- Backspace in visual mode deletes selection
map('v', '<BS>', 'd')

-- active c-backspace and alt-kspace to delete
map('n', '<C-BS>', '<C-o>dbi')
map('n', '<C-Del>', '<C-o>dwi')

-- Close the current buffer and move to the previous one
-- This replicates the idea of closing a tab
map('n', '<leader>bq', ':bp <BAR> bd #<CR>', {silent = true})
-- Force quit
map('n', '<leader>bQ', ':bp <BAR> bd! #<CR>', {silent = true})

-- Change buffer to next/previous
map('n', '<C-p>', ':bnext<CR>', {silent = true})
map('n', '<C-n>', ':bprevious<CR>', {silent = true})

-- go to beginning and end
map('i', '<C-l>', '<ESC>^i')
map('i', '<C-h>', '<End>')

-- Function to trim extra whitespace in whole file
vim.cmd [[
function! Trim()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
]]

vim.cmd "command! -nargs=0 Trim call Trim()"

