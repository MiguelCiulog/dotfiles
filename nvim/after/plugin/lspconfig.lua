local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
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
  },
})

-- Set up languages
require('lspconfig').pyright.setup{}
require('lspconfig').gopls.setup{}
require('lspconfig').jsonls.setup{}
require('lspconfig').tsserver.setup{}
