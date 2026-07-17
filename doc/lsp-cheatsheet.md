# LSP Cheat Sheet

`<leader>` is `Space`. LSP mappings marked **LSP buffer** are available only after a language server attaches to the current buffer.

## Navigation

| Shortcut | Mode | Action |
| --- | --- | --- |
| `grd` | Normal | Find definition with Telescope |
| `grD` | Normal | Go to declaration |
| `gri` | Normal | Find implementations with Telescope |
| `grr` | Normal | Find references with Telescope |
| `grt` | Normal | Find type definition with Telescope |
| `gO` | Normal | List document symbols with Telescope |
| `gW` | Normal | Search workspace symbols with Telescope |
| `<C-t>` | Normal | Jump back after following a definition |

All navigation shortcuts above are **LSP buffer** mappings.

## Code Actions

| Shortcut | Mode | Action |
| --- | --- | --- |
| `grn` | Normal | Rename the symbol under the cursor |
| `gra` | Normal, Visual | Show available code actions |
| `<Space>F` | Normal, Visual | Format the buffer or selected range asynchronously |
| `<Space>th` | Normal | Toggle inlay hints when the server supports them |

`grn`, `gra`, and `<Space>th` are **LSP buffer** mappings. Formatting is provided by `conform.nvim`; it uses configured external formatters first, then LSP formatting as a fallback.

## Diagnostics

| Shortcut | Mode | Action |
| --- | --- | --- |
| `[d` | Normal | Previous diagnostic; opens a non-focused diagnostic float |
| `]d` | Normal | Next diagnostic; opens a non-focused diagnostic float |
| `<Space>q` | Normal | Put diagnostics for the current buffer in the location list |
| `<Space>fd` | Normal | Search diagnostics with Telescope |

Diagnostics update outside Insert mode, sort by severity, show virtual text, and underline warnings and errors.

## Completion And Signatures

These come from `blink.cmp` using its `default` preset while inserting text.

| Shortcut | Action |
| --- | --- |
| `<C-y>` | Accept the selected completion |
| `<Tab>` / `<S-Tab>` | Move forward / backward through an expanded snippet |
| `<C-Space>` | Open the completion menu, or show docs when it is already open |
| `<C-n>` / `<Down>` | Select next completion item |
| `<C-p>` / `<Up>` | Select previous completion item |
| `<C-e>` | Hide the completion menu |
| `<C-k>` | Toggle signature help |

Completion documentation opens automatically after 500 ms, and signature help is enabled while entering function arguments.

## Config Sources

- `init.lua:527-556` - Telescope LSP navigation mappings
- `init.lua:625-685` - LSP actions and inlay hints
- `init.lua:188-212` - diagnostic behavior and location list
- `init.lua:818` - formatting
- `init.lua:841-900` - completion and signature help
