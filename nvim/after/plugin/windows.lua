require("windows").setup({
   autowidth = {
      enable = true,
      winwidth = 6,
      filetype = {
         help = 2,
      },
   },
   ignore = {
      buftype = { "quickfix" },
      filetype = { "NvimTree", "neo-tree", "undotree", "gundo" }
   },
   animation = {
      enable = false
   }
})
