return {
  -- Install the Nord theme plugin
  { "shaunsingh/nord.nvim" },

  -- Tell LazyVim to use it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
