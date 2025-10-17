return {
  -- Install the Nord theme plugin
  { "shaunsingh/nord.nvim" },
  { "AlexvZyl/nordic.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Tell LazyVim to use it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
