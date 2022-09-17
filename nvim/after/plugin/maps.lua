print("maps after")
-- MAPS AFTER PLUGINS

local Remap = require("aku.binds")

local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local onoremap = Remap.onoremap
local nmap = Remap.nmap

-- Find files using Telescope command-line sugar.
nnoremap('<leader>ff', '<cmd>Telescope find_files<cr>')
nnoremap('<leader>fg', '<cmd>Telescope live_grep<cr>')
nnoremap('<leader>fb', '<cmd>Telescope buffers<cr>')
nnoremap('<leader>fh', '<cmd>Telescope help_tags<cr>')


require("indent_blankline").setup {
    show_end_of_line = true,
    char = "▏",
    buftype_exclude = {"terminal"}
}

-- nnoremap('<silent><c-t>', ':NvimTreeFocus<CR>')
nnoremap('<c-t>', ':NvimTreeFocus<CR>')
