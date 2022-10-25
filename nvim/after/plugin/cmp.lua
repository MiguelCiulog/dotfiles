-- luasnip setup
local luasnip = require 'luasnip'
require("luasnip.loaders.from_vscode").lazy_load(
{ paths = { "~/.config/nvim/snippets" } }
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
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "luasnip" },
        { name = "buffer" },
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                path = "[Path]",
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
