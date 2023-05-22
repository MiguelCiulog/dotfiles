-- lspconfig
local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
    return
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set('n', '<leader>gd', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>fr', function()
        vim.lsp.buf.format { async = true }
    end, bufopts)
end

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
    { "🭽", "FloatBorder" },
    { "▔",  "FloatBorder" },
    { "🭾", "FloatBorder" },
    { "▕",  "FloatBorder" },
    { "🭿", "FloatBorder" },
    { "▁",  "FloatBorder" },
    { "🭼", "FloatBorder" },
    { "▏",  "FloatBorder" },
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local protocol = require("vim.lsp.protocol")
protocol.CompletionItemKind = {
    "", -- Text
    "", -- Method
    "", -- Function
    "", -- Constructor
    "ﰠ", -- Field
    "", -- Variable
    "ﴯ", -- Class
    "", -- Interface
    "", -- Module
    "ﰠ", -- Property
    "塞", -- Unit
    "", -- Value
    "", -- Enum
    "", -- Keyword
    "", -- Snippet
    "", -- Color
    "", -- File
    "", -- Reference
    "", -- Folder
    "", -- EnumMember
    "", -- Constant
    "פּ", -- Struct
    "", -- Event
    "", -- Operator
    "", -- TypeParameter
}

-- Format on save and on command
vim.cmd("command! -nargs=0 Format lua vim.lsp.buf.format {async = true}")

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
    },
    update_in_insert = true,
    float = {
        source = "always", -- Or "if_many"
    },
})

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = lsp_capabilities,
        })
    end,
})

-- Set up extra languages (Not in mason)
require("lspconfig").gdscript.setup({
    on_attach = on_attach,
    flags = { debounce_text_changes = 300 },
    filetypes = { "gd", "gdscript", "gdscript3" },
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

nvim_lsp.pyright.setup({
    on_attach = on_attach,
    flags = { debounce_text_changes = 300, },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic",
            },
        },
    },
}
)

-- require('lspconfig').pylsp.setup{
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           ignore = {'W391'},
--           maxLineLength = 100
--         }
--       }
--     }
--   }
-- }

-- lspkind
local status, lspkind = pcall(require, "lspkind")
if not status then
    return
end

lspkind.init({
    -- enables text annotations
    --
    -- default: true
    mode = "symbol",
    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = "codicons",
    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = "",
    },
})

-- lspsaga
-- local status, saga = pcall(require, "lspsaga")
-- if not status then
-- 	return
-- end

require("lspsaga").setup({
    ui = {
        border = "rounded",
        title = true,
        winblend = 0,
        expand = "",
        collapse = "",
        code_action = "",
        incoming = " ",
        outgoing = " ",
        hover = " ",
        diagnostic = " ",
        kind = {},
    },
    hover = {
        max_width = 0.6,
    },
    diagnostic = {
        on_insert = true,
        on_insert_follow = false,
        insert_winblend = 0,
        show_virt_line = true,
        show_code_action = true,
        show_source = true,
        jump_num_shortcut = true,
        max_width = 0.7,
        text_hl_follow = false,
        border_follow = true,
        keys = {
            exec_action = "o",
            quit = "q",
            go_action = "g",
        },
    },
    code_action = {
        num_shortcut = true,
        show_server_name = false,
        extend_gitsigns = false,
        keys = {
            quit = "q",
            exec = "<CR>",
        },
    },
    lightbulb = {
        enable = false,
        enable_in_insert = true,
        -- cache_code_action = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
    },
    preview = {
        lines_above = 0,
        lines_below = 10,
    },
    scroll_preview = {
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
    },
    request_timeout = 2000,
    finder = {
        --percentage
        max_height = 0.5,
        force_max_height = false,
        keys = {
            jump_to = "p",
            edit = { "o", "<CR>" },
            vsplit = "s",
            split = "i",
            tabe = "t",
            tabnew = "r",
            quit = { "q", "<ESC>" },
            close_in_preview = "<ESC>",
        },
    },
    definition = {
        edit = "<C-c>o",
        vsplit = "<C-c>v",
        split = "<C-c>i",
        tabe = "<C-c>t",
        quit = "q",
    },
    rename = {
        quit = "<C-c>",
        exec = "<CR>",
        mark = "x",
        confirm = "<CR>",
        in_select = true,
    },
    symbol_in_winbar = {
        enable = false,
        ignore_patterns = {},
        separator = " ",
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        respect_root = false,
        color_mode = true,
    },
    outline = {
        win_position = "right",
        win_with = "",
        win_width = 30,
        auto_preview = true,
        auto_refresh = true,
        auto_close = true,
        custom_sort = nil,
        keys = {
            jump = "o",
            expand_collapse = "u",
            quit = "q",
        },
    },
    callhierarchy = {
        show_detail = false,
        keys = {
            edit = "e",
            vsplit = "s",
            split = "i",
            tabe = "t",
            jump = "o",
            quit = "q",
            expand_collapse = "u",
        },
    },
    beacon = {
        enable = false,
        frequency = 7,
    },
    server_filetype_map = {},
})

local map = require("aku.binds").map

-- Peek Definition
-- you can edit the definition file in this floatwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
map("n", "gD", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
map("n", "<leader>gr", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Hover Doc
-- map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Rename | Broken
-- map("n", "<F2>", ":Lspsaga rename<Enter><Esc>a", { silent = true })

-- Code action
map("n", "<leader>ac", "<cmd>Lspsaga code_action<CR>", { silent = true })
map("v", "<leader>ac", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Show line diagnostics
map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Outline
map("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Extra pyright config

function filter(arr, func)
    -- Filter in place
    -- https://stackoverflow.com/questions/49709998/how-to-filter-a-lua-array-inplace
    local new_index = 1
    local size_orig = #arr
    for old_index, v in ipairs(arr) do
        if func(v, old_index) then
            arr[new_index] = v
            new_index = new_index + 1
        end
    end
    for i = new_index, size_orig do
        arr[i] = nil
    end
end

function filter_diagnostics(diagnostic)
    -- Only filter out Pyright stuff for now
    if diagnostic.source ~= "Pyright" then
        return true
    end

    -- Allow kwargs to be unused, sometimes you want many functions to take the
    -- same arguments but you don't use all the arguments in all the functions,
    -- so kwargs is used to suck up all the extras
    -- if diagnostic.message == '"kwargs" is not accessed' then
    -- 	return false
    -- end

    -- Allow variables starting with an underscore
    if string.match(diagnostic.message, '"_.+" is not accessed') then
        return false
    end

    if string.find(diagnostic.message, 'Argument of type "Column" cannot be assigned to parameter') then
        return false
    end

    if diagnostic.message == "Illegal type annotation: call expression not allowed" then
        return false
    end

    if string.find(diagnostic.message, 'Expression of type "Column" cannot be assigned to declared type') then
        return false
    end

    return true
end

function custom_on_publish_diagnostics(a, params, client_id, c, config)
    filter(params.diagnostics, filter_diagnostics)
    vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_id, c, config)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(custom_on_publish_diagnostics, {})
