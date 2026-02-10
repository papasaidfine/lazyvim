return {
  {
    "hkupty/iron.nvim",
    config = function()
      local iron = require("iron.core")

      local function find_executable(names)
        for _, name in ipairs(names) do
          if vim.fn.executable(name) == 1 then
            return name
          end
        end
      end

      local ipython = find_executable({ "ipython3", "ipython" })

      iron.setup({
        config = {
          repl_definition = {
            python = {
              command = ipython and { ipython, "--no-autoindent" } or { "python3" },
              format = require("iron.fts.common").bracketed_paste_python,
            },
            r = { command = { "R", "--no-save", "--no-restore", "--interactive" } },
          },
          repl_open_cmd = "botright 15 split",
        },
      })

      vim.keymap.set("n", "<leader>rr", "<cmd>IronRepl<CR>", { desc = "Start REPL" })

      vim.keymap.set("n", "<leader>rl", function()
        iron.send_line()
        vim.cmd("normal! j")
      end, { desc = "Send line and move down" })

      vim.keymap.set("v", "<leader>rl", function()
        iron.visual_send()
        vim.cmd("normal! `>j")
      end, { desc = "Send selection and move down" })

      vim.keymap.set("n", "<leader>rp", function()
        iron.send_paragraph()
        vim.cmd("normal! }j")
      end, { desc = "Send paragraph and move to next" })
    end,
  },
}
