return {
  "nvim-mini/mini.files",

  opts = {
    windows = {
      preview = true,
      -- Width of focused window
      width_focus = 50,
      -- Width of non-focused window
      width_nofocus = 30,
      -- Width of preview window
      width_preview = 100,
    },
    options = {
      -- Whether to use for editing directories
      -- Disabled by default in LazyVim because neo-tree is used for that
      use_as_default_explorer = false,
    },
  },
}
