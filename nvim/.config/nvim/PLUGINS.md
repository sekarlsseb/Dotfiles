# Neovim plugin guide

LazyVim-based config. **Leader = `<Space>`**. Press `<Space>` and wait: which-key shows every available key.
Search all keymaps any time with `<leader>sk`. Manage plugins with `<leader>l` (Lazy) and `:Mason`.

## Your overrides (`lua/config/keymaps.lua`)

| Key | Action |
|---|---|
| `jj` (insert) | Leave insert mode |
| `<leader>w` | Save (normal + visual) |
| `<leader>q` | Quit window (normal + visual) |
| `<leader>y` | Yank to system clipboard (normal + visual) |
| `<leader>p` (visual) | Paste without overwriting the register |
| `<C-a>` | Select all |
| `<C-d>` / `<C-u>` | Half-page scroll, cursor kept centered |
| `<A-j>` / `<A-k>` | Move line down/up (visual: `J` / `K`) |
| `-` | Open parent directory in Oil |

Notes:
- `<leader>w` and `<leader>q` also exist in LazyVim as *prefixes* (`<leader>wd`, `<leader>-`, `<leader>qq`, `<leader>qs`...).
  Neovim therefore waits for `timeoutlen` (default 1000 ms) before running a bare `<leader>w`/`<leader>q`.
  If saving feels laggy, add `vim.opt.timeoutlen = 300` to `lua/config/options.lua`.
- Window commands from the `<leader>w` group are still available via `<C-w>` (e.g. `<C-w>v` split, `<C-w>c` close) and `<C-h/j/k/l>` to move between windows.
- `<C-s>` (LazyVim default) also saves in insert/normal mode.

## Core / framework

| Plugin | What it does | Use |
|---|---|---|
| **lazy.nvim** | Plugin manager | `<leader>l` opens UI; `S` sync, `U` update, `x` clean |
| **LazyVim** | Preconfigured distro of defaults, keymaps, extras | `:LazyExtras` to toggle extras (stored in `lazyvim.json`) |
| **plenary.nvim**, **nui.nvim** | Lua helper libraries other plugins depend on | No direct use |
| **snacks.nvim** | Folke's utility suite: picker, explorer, dashboard, terminal, lazygit, notifications, toggles | See sections below |
| **which-key.nvim** | Popup showing available keys after a prefix | Press `<leader>` and wait; `<leader>?` shows buffer keymaps |
| **persistence.nvim** | Session save/restore | `<leader>qs` restore session, `<leader>ql` last session |

## Finding things (snacks picker + explorer)

| Key | Action |
|---|---|
| `<leader><space>` / `<leader>ff` | Find files (project root) |
| `<leader>/` / `<leader>sg` | Grep in project (needs `ripgrep`) |
| `<leader>,` / `<leader>fb` | Open buffers |
| `<leader>fr` | Recent files |
| `<leader>fg` | Git-tracked files |
| `<leader>sw` | Grep word under cursor / selection |
| `<leader>sd` | Diagnostics list |
| `<leader>ss` | LSP symbols in file |
| `<leader>sk` | Search keymaps |
| `<leader>:` | Command history |
| `<leader>n` | Notification history |
| `<leader>e` | Toggle file explorer |
| `<leader>uC` | Colorscheme picker |
| `<leader>ft` / `<C-/>` | Terminal |

`fd` and `ripgrep` must be installed for fast file finding and grep.

## Navigation & editing

| Plugin | What it does | Use |
|---|---|---|
| **flash.nvim** | Jump anywhere on screen with 2-3 keystrokes | `s` + chars then the label; `S` select treesitter nodes |
| **oil.nvim** (added) | Edit directories like a buffer: rename/delete/move by editing text, then `:w` | `-` open parent dir; `<CR>` open; `g?` help |
| **harpoon2** (extra) | Pin a few files and jump instantly | `<leader>H` add file, `<leader>h` menu, `<leader>1`..`9` jump |
| **mini.surround** (extra) | Add/delete/replace surrounding quotes, brackets, tags | `gsa` add (e.g. `gsaiw"`), `gsd` delete, `gsr` replace |
| **mini.ai** | Better text objects (`a`/`i`) for args, quotes, functions | `daf` delete function, `ci"`, `yia` argument |
| **mini.pairs** | Auto-close brackets/quotes | Automatic |
| **ts-comments.nvim** | Correct comment strings per language (embedded langs) | `gcc` toggle line, `gc` + motion / visual |
| **nvim-ts-autotag** | Auto close/rename HTML/JSX tags | Automatic |
| **nvim-treesitter** / **-textobjects** | Syntax highlighting, indent, structural motions | `]f` / `[f` next/prev function, `]c` class; `:TSInstallInfo` |
| **grug-far.nvim** | Project-wide search & replace UI | `<leader>sr` |

## Completion, LSP, formatting, linting

| Plugin | What it does | Use |
|---|---|---|
| **blink.cmp** | Completion engine (LSP, path, snippets, buffer) | `<C-y>` accept (also `<CR>` per preset), `<C-n>`/`<C-p>` select, `<C-space>` open docs/menu |
| **friendly-snippets** | Snippet collection used by blink | Appears in completion menu |
| **nvim-lspconfig** | LSP client configs | `gd` definition, `K` hover, `grr` references, `gri` implementation, `grn` rename, `gra` code action (nvim 0.11+ defaults); `:LspInfo` |
| **mason.nvim** / **mason-lspconfig** | Installer for LSP servers, formatters, linters, debuggers | `:Mason`; `i` install, `X` uninstall, `U` update all |
| **conform.nvim** | Formatting (format on save is on in LazyVim) | `<leader>cf` format; `<leader>uf` toggle autoformat |
| **nvim-lint** | Linting for filetypes with configured linters | Runs on save/read; shows as diagnostics |
| **lazydev.nvim** | Lua API completion for editing nvim config | Automatic in Lua files |
| **trouble.nvim** | Pretty diagnostics/quickfix/symbol lists | `<leader>xx` all diagnostics, `<leader>xX` buffer, `<leader>xQ` quickfix, `<leader>xL` loclist |
| **todo-comments.nvim** | Highlights/searches TODO, FIXME, HACK... | `]t` / `[t` next/prev; `<leader>st` search; `<leader>sT` TODO/FIX only |

Diagnostics: `]d`/`[d` next/prev, `]e`/`[e` errors, `]w`/`[w` warnings, `<leader>cd` line diagnostics, `<leader>ud` toggle.

## Git

| Plugin | What it does | Use |
|---|---|---|
| **gitsigns.nvim** | Gutter signs, hunk stage/preview/blame | `]h` / `[h` next/prev hunk; `<leader>ghs` stage hunk; `<leader>ghp` preview inline |
| **lazygit** (via snacks) | Full git TUI | `<leader>gg` (repo root), `<leader>gG` (cwd) |
| Snacks git pickers | History and blame | `<leader>gl` log, `<leader>gf` file history, `<leader>gb` blame line, `<leader>gB` open on GitHub |
| **lang.git extra** | Highlighting for git config/commit files | Automatic |

## UI

| Plugin | What it does | Use |
|---|---|---|
| **tokyonight.nvim** | Default colorscheme | `<leader>uC` to switch |
| **catppuccin** | Alternate colorscheme (installed with LazyVim) | `<leader>uC` |
| **lualine.nvim** | Statusline | Automatic |
| **bufferline.nvim** | Buffer tabs | `<S-h>` / `<S-l>` prev/next buffer; `<leader>bd` close; `<leader>bo` close others |
| **noice.nvim** | Floating cmdline, messages, LSP docs | `<C-f>` / `<C-b>` scroll LSP docs; `<leader>sn` noice history |
| **mini.icons** | Icon provider | Automatic |

Useful toggles: `<leader>uw` wrap, `<leader>us` spell, `<leader>ul` line numbers, `<leader>uL` relative numbers, `<leader>uh` inlay hints.

## Debugging (`dap.core` extra)

Provides nvim-dap, nvim-dap-ui, virtual text, and Mason integration.

| Key | Action |
|---|---|
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dc` | Run / continue |
| `<leader>dC` | Run to cursor |
| `<leader>di` / `<leader>dO` / `<leader>do` | Step into / over / out |
| `<leader>dt` | Terminate |
| `<leader>du` | Toggle debugger UI |
| `<leader>de` | Evaluate expression (normal/visual) |
| `<leader>dr` | Toggle REPL |
| `<leader>dl` | Run last |

## C# (`lua/plugins/csharp.lua`)

| Piece | Role |
|---|---|
| **roslyn.nvim** | Microsoft Roslyn language server: completion, diagnostics, analyzers, go-to-definition, code actions, inlay hints, code lens. Installed through Mason from the `Crashdummyy/mason-registry` registry. |
| **csharpier** | Formatter, run by conform (`<leader>cf` or on save) |
| **netcoredbg** | Debugger adapter used by nvim-dap (`coreclr`) |
| **treesitter `c_sharp`** | Highlighting and text objects |

Prerequisites (run yourself, needs sudo):

```bash
sudo pacman -S dotnet-sdk aspnet-runtime ripgrep fd
```

Workflow:
1. `cd` into a folder containing a `.sln` or `.csproj` and open a `.cs` file. Roslyn finds the solution automatically; with several solutions, use `:Roslyn target` to choose one.
2. First launch: wait for Mason to install `roslyn`, `csharpier`, `netcoredbg` (check `:Mason`). Restart nvim if needed.
3. Code as normal: `gd`, `K`, `gra`, `grn`, `<leader>cf`, `<leader>xx` for the diagnostics list.
4. Debug: set a breakpoint with `<leader>db`, press `<leader>dc`. The config runs `dotnet build`, then asks for the dll path (default `bin/Debug/`, press Tab to complete, e.g. `bin/Debug/net9.0/App.dll`).
5. Check health with `:checkhealth vim.lsp`, `:LspInfo`, `:Mason`.

The `lang.dotnet` extra is intentionally not enabled because it configures OmniSharp, which would conflict with Roslyn.

## Enabled LazyVim extras

`coding.mini-surround`, `dap.core`, `editor.harpoon2`, `lang.git`, `lang.json`, `lang.toml`, `util.dot` (bash LSP + shellcheck for your dotfiles).
Toggle more with `:LazyExtras`.
