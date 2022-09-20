local map = require("aku.binds").map

-- require("commentary").setup({
--     use_default_mappings = false
-- })
 
require("Comment").setup({
    ---Lines to be ignored while (un)comment
    ignore = '^$'
})
-- map('n', '<C-/>', 'lua require("Comment.api").toggle.linewise.current()', { silent = true })
map('n', "<leader>/", '<Plug>(comment_toggle_linewise_current)')

local n = '<ESC><cmd>lua require("Comment.api")'
local j = '.toggle.linewise(vim.fn.visualmode())<CR>'

map('v', "<leader>/", n .. j)


