return {
  {
    "hkupty/iron.nvim",
    config = function()
      local iron = require("iron.core")

      -- Function to get Python command from venv or system
      local function get_python_command()
        local venv = os.getenv("VIRTUAL_ENV")
        if venv then
          return { venv .. "/bin/python" }
        else
          return { "python3" }
        end
      end

      iron.setup({
        config = {
          repl_definition = {
            python = {
              command = get_python_command(),
              format = require("iron.fts.common").bracketed_paste,
            },
            r = { command = { "R", "--no-save", "--no-restore", "--interactive" } },
          },
          repl_open_cmd = "botright 15 split",
        },
      })

      -- Start REPL
      vim.keymap.set("n", "<leader>rr", "<cmd>IronRepl<CR>", { desc = "Start REPL" })

      -- (1) Send line + Send newline, then go next
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

      -- (3) Send paragraph (handles indented blocks better)
      vim.keymap.set("n", "<leader>rp", function()
        iron.send_paragraph()
        vim.cmd("normal! }j") -- move to next paragraph
      end, { desc = "Send paragraph and move to next" })
    end,
  },
}
