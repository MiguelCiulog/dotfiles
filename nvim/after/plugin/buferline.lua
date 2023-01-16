local map = require("aku.binds").map
require('bufferline').setup {
    options = {
        diagnostics =  "nvim_lsp",
    }
}

map('n', '<C-p>', ':BufferLineCycleNext<CR>', {silent = true})
map('n', '<C-n>', ':BufferLineCyclePrev<CR>', {silent = true})
map("n", "<c-,>", ":BufferLineMovePrev<CR>", {silent=true})
map("n", "<c-.>", ":BufferLineMoveNext<CR>", {silent=true})
