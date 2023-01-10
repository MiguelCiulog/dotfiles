local map = require("aku.binds").map
require('bufferline').setup {
    options = {
        diagnostics =  "nvim_lsp",
    }
}
map("n", "<c-,>", ":BufferLineMovePrev<CR>", {silent=true})
map("n", "<c-.>", ":BufferLineMoveNext<CR>", {silent=true})
