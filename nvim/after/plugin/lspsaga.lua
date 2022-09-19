local status, saga = pcall(require, "lspsaga")
if (not status) then return end

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
map("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Hover Doc
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Rename
map("n", "<F2>", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Code action
map("n", "<leader>ac", "<cmd>Lspsaga code_action<CR>", { silent = true })
map("v", "<leader>ac", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Show line diagnostics
map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Outline
map("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })

