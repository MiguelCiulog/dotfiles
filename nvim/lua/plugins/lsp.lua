-- LSP keymaps
return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    -- keys[#keys + 1] = { "K", "<cmd>echo 'hello'<cr>" }

    -- disable a keymap
    keys[#keys + 1] = { "<leader>cl", false }
    keys[#keys + 1] = { "<leader>cr", false }

    -- add a keymap
    keys[#keys + 1] = { "<F2>", vim.lsp.buf.rename, desc = "Rename" }
  end,
}
