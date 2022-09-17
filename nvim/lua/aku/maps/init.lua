local Remap = require("aku.binds")

local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local onoremap = Remap.onoremap
local nmap = Remap.nmap

-- MAPS NEOVIM MACR


-- Delete without yank
nnoremap('<leader>d,', '"_d')
vnoremap('<leader>d,', '"_d')
onoremap('<leader>d,', '"_d')
nnoremap('x', '"_x')
nnoremap('X', '"_X')

-- Paste the last thing yanked, not deleted
nnoremap('<leader>p', '"0p')
nnoremap('<leader>P', '"0P')


-- Select everything ggVG
nnoremap('<c-a>', 'ggVG')

-- Remap go to end of line ($) and go to start of line (^)
nnoremap ('H', '^')
nnoremap ('L', '$')
vnoremap ('H', '^')
vnoremap ('L', '$')

-- c-s to save in normal mode
nnoremap('<c-s>', ':w<Enter>')

-- Press s to add an extra line
-- The o<Esc>^Da is for deleting comments on the start of the line
nnoremap('s', 'o<Esc>^"_D')
nnoremap('S', 'O<Esc>^"_D')

-- Backspace in visual mode deletes selection
vnoremap('<BS>', 'd')

-- Use ctrl-[ijkl] to select the active split
nmap ('<silent> <c-up>', ':wincmd k<CR>')
nmap ('<silent> <c-down>', ':wincmd j<CR>')
nmap ('<silent> <c-left>', ':wincmd h<CR>')
nmap ('<silent> <c-right>', ':wincmd l<CR>')

-- TODO: Remap replace to ctrl + r

-- active c-backspace and alt-basckspace to delete
inoremap('<C-H>', '<C-W>')
inoremap('<C-Del>', '<C-o>dw')

-- Close the current buffer and move to the previous one
-- This replicates the idea of closing a tab
nmap('<silent><leader>bq', ':bp <BAR> bd #<CR>')
-- Force quit
nmap('<silent><leader>bQ', ':bp <BAR> bd! #<CR>')

