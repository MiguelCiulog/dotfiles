local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- vim.keymap.set('n', '<leader>gd', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local protocol = require('vim.lsp.protocol')
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
    "" -- TypeParameter
}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}
-- Format on save and on command
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
vim.cmd "command! -nargs=0 Format lua vim.lsp.buf.formatting {}"

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  }
})

-- Set up languages
require('lspconfig').pyright.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig').gopls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig').jsonls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig').tsserver.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
