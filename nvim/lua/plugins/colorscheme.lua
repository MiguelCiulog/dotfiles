return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "felipeagc/fleet-theme-nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  {'doums/dark.nvim'},

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      -- colorscheme = "kanagawa-dragon",
      -- colorscheme = "fleet",
      -- colorscheme = "oxocarbon",
      colorscheme = "dark",
    },
  },
}
