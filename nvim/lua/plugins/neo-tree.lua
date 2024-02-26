return {
  {
    "neo-tree.nvim",
    keys = function()
      return {
        {
          "<C-t>",
          function()
            require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
          end,
          desc = "Explorer NeoTree (root dir)",
        },
      }
    end,

    opts = {
      window = {
        position = "right",
      },
    },
  },
}
