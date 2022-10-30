local map = require("aku.binds").map

require("dapui").setup()
local dap = require('dap')
require('dap-go').setup()
dap.defaults.fallback.terminal_win_cmd = '50vsplit new'

map('n', '<F5>', '<Cmd>lua require"dap".continue()<CR>')
map('n', '<F10>', '<Cmd>lua require"dap".step_over()<CR>')
map('n', '<F11>', '<Cmd>lua require"dap".step_into()<CR>')
map('n', '<F12>', '<Cmd>lua require"dap".step_out()<CR>')
map('n', '<Leader>b', '<Cmd>lua require"dap".toggle_breakpoint()<CR>')
map('n', '<Leader>B', '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')

vim.cmd "command Debug :lua require('dapui').toggle()"

-- map('n', '<Leader>lp', '<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
-- map('n', '<Leader>dr', '<Cmd>lua require"dap".repl.open()<CR>')
-- map('n', '<Leader>dl', '<Cmd>lua require"dap".run_last()<CR>')
