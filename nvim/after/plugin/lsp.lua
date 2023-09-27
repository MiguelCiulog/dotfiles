local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = bufnr})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = bufnr})
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer = bufnr})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = bufnr})
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, {buffer = bufnr})

    vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, {buffer = bufnr})
    vim.keymap.set("n", "]e", vim.diagnostic.goto_next, {buffer = bufnr})

    vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, {buffer = bufnr})
    vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, {buffer = bufnr})

    vim.keymap.set('n', '<space>fr', function()
        vim.lsp.buf.format { async = true }
    end, {buffer = bufnr})
end)

require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls",
        "pyright",
        "gopls",
        "jsonls",
        "tsserver",
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

-- CMP

-- local has_words_before = function()
--     local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
--     return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

-- luasnip setup
local luasnip = require("luasnip")
require('luasnip.loaders.from_vscode').lazy_load()

-- lsp-kind setup (Pictograms)
local lspkind = require 'lspkind'

-- nvim-cmp setup
local cmp = require 'cmp'
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup {
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),
    sources = {
        { name = "luasnip" },
        {
            name = "nvim_lsp",
            entry_filter = function(entry, _)
                return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
            end
        },
        {
            name = "buffer",
            keyword_length = 5,
        },
        { name = "nvim_lua" },
        { name = "path" },
    },
    formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = lspkind.cmp_format({
            mode = 'symbol',       -- show only symbol annotations
            maxwidth = 50,         -- prevent the popup from showing more than provided characters
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
        })
    }
}

-- Colors on letters
-- gray
vim.cmd "highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080"
-- blue"
vim.cmd "highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6"
vim.cmd "highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6"
-- light" blue"
vim.cmd "highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE"
vim.cmd "highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE"
vim.cmd "highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE"
-- pink"
vim.cmd "highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0"
vim.cmd "highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0"
-- front""
vim.cmd "highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4"
vim.cmd "highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4"
vim.cmd "highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4"

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

-- EXTRA LSP FUNCTIONAL SETTINGS

-- local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- local lspconfig = require("lspconfig")
-- require("mason-lspconfig").setup_handlers({
--     function(server_name)
--         lspconfig[server_name].setup({
--             on_attach = on_attach,
--             capabilities = lsp_capabilities,
--         })
--     end,
-- })

-- -- Set up extra languages (Not in mason)
-- require("lspconfig").gdscript.setup({
--     on_attach = on_attach,
--     flags = { debounce_text_changes = 300 },
--     filetypes = { "gd", "gdscript", "gdscript3" },
--     capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
-- })

-- nvim_lsp.pyright.setup({
--     on_attach = on_attach,
--     flags = { debounce_text_changes = 300, },
--     settings = {
--         python = {
--             analysis = {
--                 autoSearchPaths = true,
--                 diagnosticMode = "openFilesOnly",
--                 useLibraryCodeForTypes = true,
--                 typeCheckingMode = "basic",
--             },
--         },
--     },
-- }
-- )

-- -- require('lspconfig').pylsp.setup{
-- --   settings = {
-- --     pylsp = {
-- --       plugins = {
-- --         pycodestyle = {
-- --           ignore = {'W391'},
-- --           maxLineLength = 100
-- --         }
-- --       }
-- --     }
-- --   }
-- -- }

-- -- Extra pyright config

-- function filter(arr, func)
--     -- Filter in place
--     -- https://stackoverflow.com/questions/49709998/how-to-filter-a-lua-array-inplace
--     local new_index = 1
--     local size_orig = #arr
--     for old_index, v in ipairs(arr) do
--         if func(v, old_index) then
--             arr[new_index] = v
--             new_index = new_index + 1
--         end
--     end
--     for i = new_index, size_orig do
--         arr[i] = nil
--     end
-- end

-- function filter_diagnostics(diagnostic)
--     -- Only filter out Pyright stuff for now
--     if diagnostic.source ~= "Pyright" then
--         return true
--     end

--     -- Allow kwargs to be unused, sometimes you want many functions to take the
--     -- same arguments but you don't use all the arguments in all the functions,
--     -- so kwargs is used to suck up all the extras
--     -- if diagnostic.message == '"kwargs" is not accessed' then
--     -- 	return false
--     -- end

--     -- Allow variables starting with an underscore
--     if string.match(diagnostic.message, '"_.+" is not accessed') then
--         return false
--     end

--     if string.find(diagnostic.message, 'Argument of type "Column" cannot be assigned to parameter') then
--         return false
--     end

--     if diagnostic.message == "Illegal type annotation: call expression not allowed" then
--         return false
--     end

--     if string.find(diagnostic.message, 'Expression of type "Column" cannot be assigned to declared type') then
--         return false
--     end

--     return true
-- end

-- function custom_on_publish_diagnostics(a, params, client_id, c, config)
--     filter(params.diagnostics, filter_diagnostics)
--     vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_id, c, config)
-- end

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(custom_on_publish_diagnostics, {})
