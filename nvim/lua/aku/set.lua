vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

vim.g.mapleader = " "

-- Set default splits to down and right
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.signcolumn = "yes"

-- Allow buffer switching without saving
vim.opt.hidden = true

vim.opt.ruler = true
vim.opt.enc = "utf-8"
vim.opt.cursorline = true
-- vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"
vim.opt.scrolloff = 8

vim.opt.list = true
vim.opt.background = "dark"

if vim.g.neovide then
    vim.o.guifont = "Mononoki_Nerd_Font_Mono:h13"

    vim.g.neovide_transparency = 0.97
    vim.g.neovide_scroll_animation_length = 0.1

    vim.g.neovide_cursor_animation_length = 0.05
    vim.g.neovide_cursor_trail_size = 0.5

    vim.keymap.set("v", "<D-c>", '"+y')         -- Copy
    vim.keymap.set("n", "<D-v>", '"+P')         -- Paste normal mode
    vim.keymap.set("v", "<D-v>", '"+P')         -- Paste visual mode
    vim.keymap.set("c", "<D-v>", "<C-R>+")      -- Paste command mode
    vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end

-- Clipboard support for wsl
local in_wsl = os.getenv("WSL_DISTRO_NAME") ~= nil
if in_wsl then
    local uwu = os.getenv("win32yank.exe") ~= nil
    vim.g.clipboard = {
        name = "wsl clipboard",
        copy = { ["+"] = { "clip.exe" }, ["*"] = { "clip.exe" } },
        paste = {
            ["+"] = 'win32yank.exe -o --lf',
            ["*"] = 'win32yank.exe -o --lf',
        },
        cache_enabled = false,
    }
end
