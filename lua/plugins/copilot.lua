return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,       -- enable suggestions
        auto_trigger = true,  -- trigger automatically
        keymap = {
          accept = "<C-l>",   -- key to accept suggestion
        },
      },
      panel = { enabled = true }, -- optional panel
    })
  end,
}

