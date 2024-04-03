return {
  {
    -- "nvim-telescope/telescope.nvim",
    "telescope.nvim",
    -- replace all keymaps with custom mapping
    opts = {
      defaults = {
        path_display = {"truncate"},
      },
    },
    keys = function()
      return {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "grep files" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Show buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Show help tags" },

        {
          "gr",
          '<cmd>lua require("telescope.builtin").lsp_references()<cr>',
          desc = "show lsp references",
        },

        { "<leader>tn", "<cmd>tabnew | Telescope find_files<CR>", desc = "Add tab/workspace" },
        { "<leader>td", "<cmd>tabclose<CR>", desc = "Remove tab/workspace" },
      }
    end,
  },
}
