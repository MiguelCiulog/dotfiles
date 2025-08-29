return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "nickkadutskyi/jb.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "jb",
      -- colorscheme = "gruvbox",
    },
  },
}
