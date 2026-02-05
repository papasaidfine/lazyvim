# 💤 LazyVim

Personal [LazyVim](https://github.com/LazyVim/LazyVim) configuration.

## Features

- **Colorscheme**: Nord (with nordic and catppuccin available)
- **AI**: GitHub Copilot
- **REPL**: iron.nvim for Python and R
- **Formatting**: Prettier via LazyVim extras (manual trigger, auto-format disabled)

## REPL Keymaps (iron.nvim)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>rr` | n | Start REPL |
| `<leader>rl` | n | Send line and move down |
| `<leader>rl` | v | Send selection and move down |
| `<leader>rp` | n | Send paragraph and move to next |

Python REPL automatically uses the active virtualenv if `$VIRTUAL_ENV` is set.

## Other Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `<Esc>` | t | Exit terminal mode |

## Structure

```
lua/
├── config/
│   ├── keymaps.lua    # Custom keymaps
│   ├── lazy.lua       # Plugin manager setup
│   └── options.lua    # Vim options (autoformat disabled)
└── plugins/
    ├── colorscheme.lua  # Nord theme
    ├── copilot.lua      # Copilot config
    ├── iron.lua         # REPL for Python/R
    └── example.lua      # Additional plugins
```

## Installation

1. Backup existing config: `mv ~/.config/nvim ~/.config/nvim.bak`
2. Clone: `git clone <repo-url> ~/.config/nvim`
3. Start Neovim: `nvim`
4. Plugins install automatically via lazy.nvim

## LazyVim Extras Enabled

- `ai.copilot`
- `lang.json`

Enable more via `:LazyExtras`.
