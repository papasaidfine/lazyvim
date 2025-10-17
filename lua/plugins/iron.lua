return {
  {
    "hkupty/iron.nvim",
    config = function()
      local iron = require("iron.core")

      -- Function to get Python command based on version
      local function get_python_command()
        -- Check if we're using Python 3.13+
        local handle = io.popen("python3 --version 2>&1")
        local version_output = handle:read("*a")
        handle:close()

        local major, minor = version_output:match("Python (%d+)%.(%d+)")
        major = tonumber(major)
        minor = tonumber(minor)

        -- For Python 3.13+, use PYTHON_BASIC_REPL to avoid double indentation
        if major and minor and (major > 3 or (major == 3 and minor >= 13)) then
          return { "env", "PYTHON_BASIC_REPL=1", "python3" }
        else
          return { "python3" }
        end
      end

      iron.setup({
        config = {
          repl_definition = {
            python = { command = get_python_command() },
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
        iron.send(nil, "\n") -- Extra newline to execute indented blocks
        -- move cursor to end of selection, then go one line down
        vim.cmd("normal! `>j")
      end, { desc = "Send selection and move down" })

      -- (3) Send paragraph (handles indented blocks better)
      vim.keymap.set("n", "<leader>rp", function()
        iron.send_paragraph()
        iron.send(nil, "\n") -- Extra newline to execute indented blocks
        vim.cmd("normal! }j") -- move to next paragraph
      end, { desc = "Send paragraph and move to next" })
    end,
  },
}
