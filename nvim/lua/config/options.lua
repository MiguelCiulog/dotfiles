-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
-- vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
-- vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
-- vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- Disable LazyVim auto format
vim.g.autoformat = false

vim.opt.colorcolumn = "100"

if vim.g.neovide then
  vim.o.guifont = "Mononoki_Nerd_Font_Mono:h13"

  vim.g.neovide_transparency = 0.97
  vim.g.neovide_scroll_animation_length = 0.1

  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.5

  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end

-- Clipboard support for wsl
-- local in_wsl = os.getenv("WSL_DISTRO_NAME") ~= nil
-- if in_wsl then
--   vim.g.clipboard = {
--     name = "wsl clipboard",
--     copy = { ["+"] = { "clip.exe" }, ["*"] = { "clip.exe" } },
--     paste = {
--       ["+"] = "win32yank.exe -o --lf",
--       ["*"] = "win32yank.exe -o --lf",
--     },
--     cache_enabled = false,
--   }
-- end
