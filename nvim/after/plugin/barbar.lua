local map = require("aku.binds").map
require('barbar').setup {
    animation = false,
    auto_hide = true,
    icons = {
        -- Configure the base icons on the bufferline.
        -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
        buffer_index = false,
        buffer_number = true,

        button = '',
        modified = { button = '!' },
        -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
        preset = 'default',

        inactive = { button = '×' },
    },
}

map('n', '<C-p>', '<Cmd>BufferNext<CR>', {silent = true})
map('n', '<C-n>', '<Cmd>BufferPrevious<CR>', {silent = true})
-- map("n", "<c-,>", "<Cmd>BufferMovePrevious<CR>", {silent=true})
-- map("n", "<c-.>", "<Cmd>BufferMoveNext<CR>", {silent=true})
