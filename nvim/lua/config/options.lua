-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = true
-- vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
-- vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
-- vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
-- vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- Disable LazyVim auto format
vim.g.autoformat = false

vim.opt.colorcolumn = "100"

vim.opt.clipboard = ""

vim.g.snacks_animate = false

-- LSP Server to use for Ruby.
-- Set to "solargraph" | "ruby_lsp".
vim.g.lazyvim_ruby_lsp = "solargraph"
vim.g.lazyvim_ruby_formatter = "rubocop"
