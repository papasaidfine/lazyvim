return {
  {
    "hkupty/iron.nvim",
    config = function()
      local iron = require("iron.core")

      iron.setup({
        config = {
          repl_definition = {
            python = { command = { "python3" } }, -- or "ipython"
          },
          repl_open_cmd = "botright 15 split",
        },
      })

      -- Start REPL
      vim.keymap.set("n", "<leader>rr", "<cmd>IronRepl<CR>", { desc = "Start REPL" })

      -- (1) Send line + go next
      vim.keymap.set("n", "<leader>rl", function()
        iron.send_line()
        vim.cmd("normal! j") -- move down
      end, { desc = "Send line and move down" })

      -- (2) Send visual selection + go after block
      vim.keymap.set("v", "<leader>rl", function()
        iron.visual_send()
        -- move cursor to end of selection, then go one line down
        vim.cmd("normal! `>j")
      end, { desc = "Send selection and move down" })
    end,
  },
}
