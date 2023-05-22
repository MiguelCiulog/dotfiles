local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- luasnip setup
local luasnip = require 'luasnip'
require("luasnip.loaders.from_vscode").lazy_load(
    { paths = { "~/.config/nvim/snippets/" } }
)

-- lsp-kind setup (Pictograms)
local lspkind = require 'lspkind'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = "luasnip" },
        {
            name = "nvim_lsp",
            entry_filter = function(entry, ctx)
                return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
            end
        },
        -- { name = "nvim_lsp" },
        { name = "buffer",  keyword_length = 5 },
        { name = "nvim_lua" },
        { name = "path" },
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                path = "[Path]",
                buffer = "[Buffer]",
            })
        }),
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

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities()
