local map = require("aku.binds").map

local dap = require('dap')
local dapui = require("dapui")

require('dap-go').setup()
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

table.insert(dap.configurations.python, {
    type = 'python',
    request = 'launch',
    name = 'FastAPI uvicorn',
    module = 'uvicorn',
    args = {
        'main:app',
        '--use-colors',
        -- '--reload', -- doesn't work
    },
    pythonPath = 'python',
    console = 'integratedTerminal',
})

require("nvim-dap-virtual-text").setup {
    commented = true,
}

dapui.setup {} -- use default
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

map('n', '<F5>', '<Cmd>lua require"dap".continue()<CR>', {silent=true})
map('n', '<F10>', '<Cmd>lua require"dap".step_over()<CR>', {silent=true})
map('n', '<F11>', '<Cmd>lua require"dap".step_into()<CR>', {silent=true})
map('n', '<F12>', '<Cmd>lua require"dap".step_out()<CR>', {silent=true})
map(
    'n', '<Leader>b', '<Cmd>lua require"dap".toggle_breakpoint()<CR>',
    {silent=true, nowait=true}
)
-- map('n', '<Leader>B', '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')

vim.cmd "command Debug :lua require('dapui').toggle()"

-- map('n', '<Leader>lp', '<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
-- map('n', '<Leader>dr', '<Cmd>lua require"dap".repl.open()<CR>')
-- map('n', '<Leader>dl', '<Cmd>lua require"dap".run_last()<CR>')
