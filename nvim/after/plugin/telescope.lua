local map = require("aku.binds").map

require('telescope').setup{
    defaults = {
        file_ignore_patterns = { "node_modules", ".git", "__pycache__" }
    }
}

-- Find files using Telescope command-line sugar.
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
